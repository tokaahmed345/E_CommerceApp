   import 'package:flutter/material.dart';

class Helpers{

    static void showSnackbar(BuildContext context, String message, {Color backgroundColor = Colors.red}) {
        double screenWidth = MediaQuery.of(context).size.width;
  double fontSize = screenWidth * 0.05;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message,style: TextStyle(fontSize: fontSize),),
        duration: Duration(seconds:1 ),

      ),
    );
  }
}