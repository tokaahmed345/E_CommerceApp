import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/screens/drawersScreens/custom_Account_Info_Card.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});
  static String id = "accountInfoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(title: "Account Info"),
      body: FutureBuilder<Map<String, String>>(
        future: SharedPref.getInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            var info = snapshot.data ?? {};

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                children: [
                  AccountInfoCard(label: "UserName", value: info['username'] ?? "N/A"),
                  AccountInfoCard(label: "Your Email", value: info['email'] ?? "N/A"),
                  AccountInfoCard(label: "Your Password", value: info['password'] ?? "N/A"),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

