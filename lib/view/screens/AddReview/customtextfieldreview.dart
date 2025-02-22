import 'package:flutter/material.dart';

class CustomTextFieldReview extends StatelessWidget {
  const CustomTextFieldReview({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.num,
  });

  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int? num;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double padding = screenWidth < 400 ? 1.0 : 3.0;
    double fontSize = screenWidth < 400 ? 14.0 : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        maxLines: num,
        controller: controller,
        validator: validator,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
