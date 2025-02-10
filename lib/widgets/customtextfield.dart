import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onChanged,this.onTap,  this.icon, this.controller,this.obscureText,this.maxLength,  this.validator,  this.hintText, });
final Function(String) ?onChanged;
 final void Function()? onTap;
 final IconData ?icon;
 final bool? obscureText ;
  final int? maxLength;
  final String ?hintText;
  final String? Function(String?) ?validator;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    maxLength: maxLength,
                    obscureText: obscureText??false,
                    controller: controller,
                    onChanged:onChanged, 
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
                      suffixIcon: InkWell(
                        onTap: onTap,
                        child: Icon(icon),
                      ),
                    ),
                  );
  }
}