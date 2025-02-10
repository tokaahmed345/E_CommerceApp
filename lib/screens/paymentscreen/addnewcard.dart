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
    return Scaffold(
      appBar: CustomAppBar(title: "Add New Card"),
      backgroundColor: Color(0xffEDE9FE),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomNewCard(
                            image: "assets/images/Frame 14.png",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomNewCard(
                            image: "assets/images/Frame 13.png",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomNewCard(
                            image: "assets/images/Frame 15.png",
                          ),
                        ],
                      ),
                    )),

SizedBox(height: 50,),
                    CustomColumnPaymentDetails()

              ],
            ),
         
         
          ),
       
       Spacer(),
       CustomContainer(text: "Add Card")
       
        ],
      ),
    );
  }
}