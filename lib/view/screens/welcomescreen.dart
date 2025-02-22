import 'package:flutter/material.dart';
import 'package:lazashopping/widgets/customcard.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  static String id = "welcomescreen";

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust padding and positioning dynamically based on screen size
    double padding = screenWidth < 600 ? 10.0 : 20.0;
    double bottomPosition = screenHeight < 600 ? 10 : 20;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.centerLeft,
              tileMode: TileMode.mirror,
              colors: [
                Color(0xffB0A3E5),
                Color(0xff7661C5),
              ]),
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: bottomPosition,
              right: padding,
              left: padding,
              child: const Customcard(),
            ),
          ],
        ),
      ),
    );
  }
}
