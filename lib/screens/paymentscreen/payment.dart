import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/screens/paymentscreen/customwidget/customListCard.dart';
import 'package:lazashopping/screens/paymentscreen/customwidget/customaddbutton.dart';
import 'package:lazashopping/screens/paymentscreen/customwidget/customcolumn.dart';
import 'package:lazashopping/widgets/customcontainer.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  static String id = 'payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment"),
      backgroundColor: Color(0xffEDE9FE),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomListCard(),
                SizedBox(
                  height: 20,
                ),
                CustomAddButton(),
                SizedBox(
                  height: 20,
                ),
                CustomColumnPaymentDetails()
              ],
            ),
          ),
          Spacer(),
          CustomContainer(text: "Save Card")
        ],
      ),
    );
  }
}
