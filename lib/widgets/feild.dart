import 'package:flutter/material.dart';
class Field extends StatelessWidget {
  final String hintText;
  const Field({super.key, required this.hintText, this.icon,  });
  final IconData ?icon;
  @override
  Widget build(BuildContext context) {
    return    Container(
      padding:const  EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: TextFormField(
        
        decoration:  InputDecoration(
            hintText: hintText,
            
            suffixIcon: Icon(icon,color: Colors.grey,),
            border: InputBorder.none
        ),
      ),
    );
  }
}
