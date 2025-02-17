import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/widgets/customratingbar.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.info});
  final Review info;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,  // Dynamic horizontal padding
        vertical: screenHeight * 0.02,  // Dynamic vertical padding
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
      
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.username ?? "No User Found",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,  // Adjust font size based on screen width
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Feedback section
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    info.feedback ?? "No Feedback",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,  // Adjust font size based on screen width
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),  // Dynamic spacing

          // Rating section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: info.rating?.toStringAsFixed(1) ?? "2.5",
                      style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " rating",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.04,  // Adjust font size based on screen width
                      ),
                    ),
                  ],
                ),
              ),
              CustomRatingBar(rating: info.rating),
            ],
          ),
        ],
      ),
    );
  }
}
