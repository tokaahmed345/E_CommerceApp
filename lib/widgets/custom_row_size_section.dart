
import 'package:flutter/material.dart';
import 'package:lazashopping/widgets/customsizeitem.dart';

class CustomRowSizeSection extends StatelessWidget {
  const CustomRowSizeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
        
        CustomsSizeItem(text: "S",),
          CustomsSizeItem(text: "M",),
        CustomsSizeItem(text: "L",),
        CustomsSizeItem(text: "XL",),
      
        CustomsSizeItem(text: "2XL",),
      
        
        
      ]),
    );
  }
}
