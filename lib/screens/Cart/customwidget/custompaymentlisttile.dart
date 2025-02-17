import 'package:flutter/material.dart';

class CustomListtileCard extends StatelessWidget {
  const CustomListtileCard({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String subTitle;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: Image.asset(
            image,
            width: screenWidth * 0.1, // Make image width responsive
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: screenWidth * 0.04), // Make title font size responsive
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(fontSize: screenWidth * 0.035), // Make subtitle font size responsive
          ),
          trailing: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: screenWidth * 0.06, // Make icon size responsive
          ),
        ),
      ),
    );
  }
}
