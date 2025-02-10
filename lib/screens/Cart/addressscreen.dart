import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAdressBody.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});
static String id="adressscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Color(0xffEDE9FE) ,
appBar: CustomAppBar(title: "Adress"),
body: CustomColumnAdreesBody(),
    );
  }
}
