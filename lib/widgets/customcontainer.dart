
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, this.onTap, required this.text,
  });
final  void Function()? onTap;
final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Color(0xff9775fa),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 25),)),
        ),),
    );
  }
}