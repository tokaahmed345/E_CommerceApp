
import 'package:flutter/material.dart';

class CustomAdressTextField extends StatelessWidget {
  const CustomAdressTextField({
    super.key,  this.controller, this.keyboardType, this.validator,this.onChanged
  });
final  TextEditingController? controller;
final TextInputType? keyboardType;
final  String? Function(String?)? validator;
 final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator:validator ,
      onChanged: onChanged,
    decoration: InputDecoration(
      
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),fillColor: Colors.grey[3250],filled: true),
    
      );
  }
}