import 'package:flutter/material.dart';

class Custombar extends StatelessWidget {
  const Custombar({
    super.key,
    required this.title,
    required this.number,
  });
  final String title;
  final double number;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double paddingValue = screenWidth * 0.05;
    double titleFontSize = screenWidth < 400 ? 25 : 35;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button with circle avatar
        CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xffEDE9FE),
          foregroundColor: Colors.black,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: screenWidth < 400 ? 20 : 25,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: paddingValue),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize, // Adjust title font size
            ),
          ),
        ),
      ],
    );
  }
}
