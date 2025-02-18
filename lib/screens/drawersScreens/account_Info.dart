import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});
  static String id = "accountInfoScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Card(
                      elevation: 10,
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                    
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "UserName is : ",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: const Color.fromARGB(255, 198, 49, 49),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "${info['username']}",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: const Color.fromARGB(255, 195, 85, 231),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Card(
                      elevation: 10,
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "Your Email is : ",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: const Color.fromARGB(255, 198, 49, 49),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "${info['email']}",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: const Color.fromARGB(255, 195, 85, 231),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]))),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.05),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Your Password is : ",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              color: const Color.fromARGB(255, 198, 49, 49),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "${info['password']}",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              color: const Color.fromARGB(255, 195, 85, 231),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]))),
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
