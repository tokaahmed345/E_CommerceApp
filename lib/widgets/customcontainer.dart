import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.onTap,
    required this.text,
  });

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity, // يأخذ كل العرض
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff9775fa),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.06, // حجم الخط ديناميكي
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
