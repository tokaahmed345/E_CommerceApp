import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  const CustomListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.4, // ضبط الارتفاع ليتناسب مع الشاشة
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: screenWidth * 0.6, // جعل العرض ديناميكيًا
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01), // تعديل الحواف لتكون متناسبة
                  child: Image.asset("assets/images/Card 1.png", fit: BoxFit.cover),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
