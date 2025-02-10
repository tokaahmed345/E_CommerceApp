
import 'package:flutter/material.dart';

class CustomAdressTextField extends StatelessWidget {
  const CustomAdressTextField({
    super.key,  this.controller,
  });
final  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
    decoration: InputDecoration(
      
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),fillColor: Colors.grey[3250],filled: true),
    
      );
  }
}