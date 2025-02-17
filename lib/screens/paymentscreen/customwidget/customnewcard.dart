import 'package:flutter/material.dart';

class CustomNewCard extends StatelessWidget {
  const CustomNewCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.25, // العرض يكون 25% من عرض الشاشة
      child: Image.asset(
        image,
        fit: BoxFit.cover, // التأكد من أن الصورة تغطي الحجم المحدد دون تشويه
      ),
    );
  }
}
