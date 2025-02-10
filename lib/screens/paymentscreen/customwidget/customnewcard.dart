

import 'package:flutter/material.dart';

class CustomNewCard extends StatelessWidget {
  const CustomNewCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Image(image: AssetImage(image)),
    );
  }
}
