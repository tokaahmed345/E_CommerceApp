
import 'package:flutter/material.dart';

class CustomRec_Button extends StatelessWidget {
  const CustomRec_Button({
    super.key, required this.text, this.icon, required this.background,required this.onTap,
  });
final String text;
final   IconData? icon;
 final Color background;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                icon ,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 8), 
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ],
            ),
          ),
    );
  }
}