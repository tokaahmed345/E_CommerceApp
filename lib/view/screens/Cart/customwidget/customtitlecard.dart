import 'package:flutter/material.dart';

class CustomTitleCard extends StatelessWidget {
  const CustomTitleCard({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02), // Adjust padding based on screen width
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.05, // Adjust font size based on screen width
        ),
      ),
    );
  }
}
