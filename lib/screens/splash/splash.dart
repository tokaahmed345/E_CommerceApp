import 'package:flutter/material.dart';
import 'package:lazashopping/screens/welcomescreen.dart';

class Splash_Screan extends StatefulWidget {
  const Splash_Screan({super.key});
  static String id = "splash";

  @override
  State<Splash_Screan> createState() => _Splash_ScreanState();
}

class _Splash_ScreanState extends State<Splash_Screan> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, Welcome_Screen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: AssetImage("assets/images/Splash.png")),
    );
  }
}
