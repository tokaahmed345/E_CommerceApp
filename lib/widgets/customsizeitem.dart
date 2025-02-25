
import 'package:flutter/material.dart';

class CustomsSizeItem extends StatelessWidget {
  const CustomsSizeItem({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 90,
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:
      Center(child: Text(text,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),))),
    );
  }
}