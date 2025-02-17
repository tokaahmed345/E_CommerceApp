import 'package:flutter/material.dart';

class CustomItemInDrawer extends StatelessWidget {
  const CustomItemInDrawer({
    super.key, 
    required this.text, 
    required this.icon, 
    this.color, 
    this.onTap
  });

  final String text;
  final IconData icon;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.05; // Adjust font size based on screen width
    double iconSize = screenWidth * 0.07; // Adjust icon size based on screen width
    double padding = screenWidth * 0.03; // Adjust padding based on screen width

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: color, size: iconSize),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                text,
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
