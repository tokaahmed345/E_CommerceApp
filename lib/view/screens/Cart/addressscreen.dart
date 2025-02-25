import 'package:flutter/material.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAdressBody.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAppbar.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});
static String id="adressscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      resizeToAvoidBottomInset: false,
appBar: const CustomAppBar(title: "Adress"),
body: const CustomColumnAdreesBody(),
    );
  }
}
