import 'package:flutter/material.dart';
import 'package:lazashopping/screens/homepage/homescreen.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});
  static String id = 'orderconfirmed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEDE9FE),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xffEDE9FE),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset("assets/images/Animation - 1739216535748.json"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Order Confirmed!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: Text(
                  "Your order has been confirmed, we will send you confirmation email shortly.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[400]),
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[3240],
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Go To Orders",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
                )
              ],
            ),
          ),
          Spacer(),
          CustomContainer(
            text: "Continue Shopping",
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          )
        ],
      ),
    );
  }
}
