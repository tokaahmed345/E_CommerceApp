import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Orders/getallorders.dart';
import 'package:lazashopping/screens/homepage/homescreen.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});
  static String id = 'orderconfirmed';

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeTitle = screenWidth * 0.08; // Title font size
    double fontSizeSubTitle = screenWidth * 0.05; // Subtitle font size
    double containerPadding = screenWidth * 0.05; // Padding for containers
    double textPadding = screenWidth * 0.04; // Padding for text elements

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: containerPadding),
            child: Column(
              children: [
                // Lottie Animation
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: Lottie.asset("assets/images/Animation - 1739216535748.json"),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  "Order Confirmed!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeTitle),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  "Your order has been confirmed, we will send you confirmation email shortly.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeSubTitle,
                      color: Colors.grey[400]),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, GetOrders.id);
                  },
                  child: Container(
                    padding: EdgeInsets.all(containerPadding),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[3240],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Go To Orders",
                      style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.05),
                    )),
                  ),
                ),
               
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
