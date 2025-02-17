import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/screens/paymentscreen/customwidget/customcolumn.dart';
import 'package:lazashopping/screens/paymentscreen/customwidget/customnewcard.dart';
import 'package:lazashopping/widgets/customcontainer.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});
  static String id = "addnewcard";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: "Add New Card"),
      backgroundColor: const Color(0xffEDE9FE),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.05,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomNewCard(image: "assets/images/Frame 14.png"),
                        SizedBox(width: screenWidth * 0.05),
                        CustomNewCard(image: "assets/images/Frame 13.png"),
                        SizedBox(width: screenWidth * 0.05),
                        CustomNewCard(image: "assets/images/Frame 15.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                const CustomColumnPaymentDetails(),
    
              ],
            ),
          ),
                   const Spacer(),
                CustomContainer(text: "Add Card"),
        ],
      ),
    );
  }
}
