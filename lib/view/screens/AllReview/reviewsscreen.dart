import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/allreviewcubit/cubit/all_review_cubit.dart';
import 'package:lazashopping/view/screens/AddReview/add_review_screen.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAppbar.dart';
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
        appBar: const CustomAppBar(title: "Reviews"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Column(
              children: [
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05));
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
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06)),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      averageRating.toStringAsFixed(1),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                    ),
                                  ),
                                  CustomRatingBar(rating: averageRating),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Text("No reviews yet.",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.02));
                        }
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffff7043),
                        border: Border.all(
                            width: 2, color: const Color(0xffff7043)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AddReviewScreen.id,
                                  arguments: productId)
                              .then((_) =>
                                  BlocProvider.of<AllReviewCubit>(context)
                                      .fetchData(productId)); 
                        },
                        child: Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(Icons.reviews_outlined,
                                    color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Add Review",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ReviewSuccess) {
                      var data = state.reviews;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ReviewSection(info: data[index]);
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text("No reviews found."));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
