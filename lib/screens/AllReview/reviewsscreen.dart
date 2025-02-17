import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/allreviewcubit/cubit/all_review_cubit.dart';
import 'package:lazashopping/screens/addreview/add_review_screen.dart';
import 'package:lazashopping/screens/addreview/customwidget/custombar.dart';
import 'package:lazashopping/services/reviewservices/allreview.dart';
import 'package:lazashopping/widgets/customcolumnreview.dart';
import 'package:lazashopping/widgets/customratingbar.dart';
class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});
  static String id = "ReviewScreen";
  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final AllReviewServces reviewServices = AllReviewServces();

    return BlocProvider(
      create: (context) => AllReviewCubit(reviewServices)..fetchData(productId),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: Column(
                children: [
                  Custombar(
                    title: "Review",
                    number: 130,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocConsumer<AllReviewCubit, AllReviewState>(
                        listener: (context, state) {
                          if (state is ReviewFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is ReviewLoading) {
                            return Text("Loading...",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20));
                          } else if (state is ReviewSuccess) {
                            int reviewCount = state.reviews.length;
                            double averageRating = state.reviews
                                    .map((review) => review.rating)
                                    .reduce((a, b) => a! + b!)! /
                                reviewCount;
                            return Column(
                              children: [
                                Text("$reviewCount Reviews",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          averageRating.toStringAsFixed(1),
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                    CustomRatingBar(rating: averageRating),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Text("No reviews yet.");
                          }
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffff7043),
                          border:
                              Border.all(width: 2, color: Color(0xffff7043)),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AddReviewScreen.id,
                                arguments: productId);
                          },
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.reviews_outlined)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Add Review",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<AllReviewCubit, AllReviewState>(
                listener: (context, state) {
                  if (state is ReviewFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ReviewLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ReviewSuccess) {
                    var data = state.reviews;
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ReviewSection(info: data[index]);
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text("No reviews found."));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
