import 'package:flutter/material.dart';
import 'package:lazashopping/screens/AddReview/customwidget/custombar.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customappbar.dart';

class DisplayPasswordScreen extends StatelessWidget {
  static const String id = 'password_screen';

  const DisplayPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Saved Pawword"),
      
      body: FutureBuilder<String>(
        
        future: SharedPref.getPassword(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(
              "Error loading password",
              style: TextStyle(fontSize: 20, color: Colors.red),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10),
              child: Card(
                elevation: 10,
                child: Container(
                  
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
               "Your Password is: ${ snapshot.data}" ?? "No password saved",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 231, 85, 209),),
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
