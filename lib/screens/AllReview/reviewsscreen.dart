import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/allreviewcubit/cubit/all_review_cubit.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
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
    final String productId = ModalRoute.of(context)!.settings.arguments as String;
    final AllReviewServces reviewServices = AllReviewServces();

    return BlocProvider(
      create: (context) => AllReviewCubit(reviewServices)..fetchData(productId),
      child: Scaffold(
        appBar: CustomAppBar(title: "Reviews"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(  // Make the body scrollable
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,  // Dynamic horizontal padding
              vertical: MediaQuery.of(context).size.height * 0.03,  // Dynamic vertical padding
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
                                  fontSize: MediaQuery.of(context).size.width * 0.05)); // Responsive font size
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
                                      fontSize: MediaQuery.of(context).size.width * 0.06)),  // Adjusted font size
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      averageRating.toStringAsFixed(1),
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),  // Adjusted font size
                                    ),
                                  ),
                                  CustomRatingBar(rating: averageRating),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Text("No reviews yet.",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.02));  // Smaller font for "No reviews"
                        }
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffff7043),
                        border: Border.all(width: 2, color: Color(0xffff7043)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AddReviewScreen.id, arguments: productId);
                        },
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.reviews_outlined, color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Add Review",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.width * 0.05)),  // Adjusted font size
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ReviewSuccess) {
                      var data = state.reviews;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,  // Dynamic horizontal padding
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,  // Use for making the ListView flexible
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
