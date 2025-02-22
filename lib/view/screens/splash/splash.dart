import 'package:flutter/material.dart';
import 'package:lazashopping/view/screens/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Welcome_Screen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/Splash.png",
          width: screenWidth,  // Set width to cover the entire screen width
          height: screenHeight, // Set height to cover the entire screen height
          fit: BoxFit.cover,  // Ensure the image covers the available space without distortion
        ),
      ),
    );
  }
}
