
import 'package:flutter/material.dart';

class CustomTextFieldReview extends StatelessWidget {
  const CustomTextFieldReview({super.key,  this.controller,  this.validator,  this.hintText, this.num});
  final String ?hintText;
  final String? Function(String?) ?validator;
 final TextEditingController? controller;
   final int? num;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: num,
                    controller: controller,
                    validator: validator,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      
                    ),
                  );
  }
}