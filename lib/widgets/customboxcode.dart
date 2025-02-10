
import 'package:flutter/material.dart';

class CustomBuildBox_Code extends StatelessWidget {
  const CustomBuildBox_Code({
    super.key, this.validator, this.onChanged,  this.focusNode,
  });
final  String? Function(String?)? validator; 
 final void Function(String)? onChanged;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: TextFormField(
          onChanged:onChanged ,
          focusNode: focusNode,
          validator:validator ,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}