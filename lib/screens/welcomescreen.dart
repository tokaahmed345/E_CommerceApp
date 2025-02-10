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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.centerLeft,
                tileMode: TileMode.mirror,
                colors: [
              Color(0xffB0A3E5),
              Color(0xff7661C5),
            ])),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Customcard(),
            ),
          ],
        ),
      ),
    );
  }
}
