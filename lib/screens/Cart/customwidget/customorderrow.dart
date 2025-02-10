import 'package:flutter/material.dart';

class CustomOrderSection extends StatelessWidget {
  const CustomOrderSection({super.key, required this.label, required this.value,this.isBold=false});
final  String label;
final   String value;
final  bool isBold;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}


  
