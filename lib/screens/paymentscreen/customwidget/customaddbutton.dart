import 'package:flutter/material.dart';
import 'package:lazashopping/screens/paymentscreen/addnewcard.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, AddNewCard.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.013, 
          horizontal: screenWidth * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 183, 169, 230),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.1, // جعل الحجم ديناميكيًا
              height: screenHeight * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.025),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 119, 79, 242),
                ),
              ),
              child: Icon(
                Icons.add,
                size: screenWidth * 0.05, // ضبط حجم الأيقونة بشكل ديناميكي
                color: Colors.black,
              ),
            ),
            SizedBox(width: screenWidth * 0.03), // المسافة بين الأيقونة والنص
            Text(
              "Add new card",
              style: TextStyle(
                color: const Color(0xffa98dfb),
                fontSize: screenWidth * 0.05, // ضبط حجم النص بناءً على الشاشة
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
