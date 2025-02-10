import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.onPressed, required this.text,required this.backgroundColor, required this.textColor, this.icon});
 final void Function()? onPressed;
 final String text;
 final Color backgroundColor;
final Color textColor;
final  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
                    style: ButtonStyle
                    
                    (
                      
            padding: ButtonStyleButton.allOrNull(EdgeInsets.symmetric(vertical: 15,horizontal: 35)),
            backgroundColor:ButtonStyleButton.allOrNull(backgroundColor),
            shape: ButtonStyleButton.allOrNull(  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))),
              onPressed: onPressed,
                
               child: Text(text,style: TextStyle(color: textColor,fontSize: 20),));
  }
}