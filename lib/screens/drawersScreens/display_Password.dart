import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';

class DisplayPasswordScreen extends StatelessWidget {
  static const String id = 'password_screen';
  const DisplayPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.05; // 5% of screen width
    return Scaffold(
      appBar: const CustomAppBar(title: "Saved Password"),
      body: FutureBuilder<String>(
        future: SharedPref.getPassword(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Error loading password",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.05, horizontal: padding),
              child: Card(
                elevation: 10,
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardTheme.color,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Your Password is : ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          color: const Color.fromARGB(255, 198, 49, 49),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "${snapshot.data ?? ""}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          color: const Color.fromARGB(255, 195, 85, 231),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]))),
              ),
            );
          }
        },
      ),
    );
  }
}
