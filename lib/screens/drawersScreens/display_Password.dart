import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customappbar.dart';

class DisplayPasswordScreen extends StatelessWidget {
  static const String id = 'password_screen';

  const DisplayPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.05; // 5% of screen width
    double fontSize = screenWidth * 0.05; // Responsive font size based on screen width

    return Scaffold(
      appBar: CustomAppBar(title: "Saved Password"),
      body: FutureBuilder<String>(
        future: SharedPref.getPassword(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error loading password",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: padding),
              child: Card(
                elevation: 10,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    "Your Password is: ${snapshot.data ?? 'No password saved'}",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 231, 85, 209),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
