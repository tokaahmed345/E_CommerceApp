import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});
  static String id = "accountInfoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Account Info"),
      body: FutureBuilder<Map<String, String>>(
        future: SharedPref.getInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            var info = snapshot.data ?? {};
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          "UserName is : ${info['username']}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06, // Make font size responsive
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 231, 85, 209),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          "Your Email is : ${info['email']}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06, // Make font size responsive
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 231, 85, 209),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        "Your Password is : ${info['password']}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06, // Make font size responsive
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 231, 85, 209),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
