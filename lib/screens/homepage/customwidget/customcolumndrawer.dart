import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/Theme/theme_cubit_cubit.dart';
import 'package:lazashopping/model/AuthModel/register.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/screens/Auth/signup.dart';
import 'package:lazashopping/screens/Orders/getallorders.dart';
import 'package:lazashopping/services/orders/get_Orders_Services.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customdraweritem.dart';

class CustomColumnDrawer extends StatelessWidget {
  const CustomColumnDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Transform.rotate(
                angle: 190,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage("assets/images/Frame 1 1.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String>(
                  future: SharedPref.getUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Loading...",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        "Error",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      );
                    } else {
                      return Text(
                        snapshot.data ?? "Guest",
                        style: TextStyle(fontSize: 20),
                      );
                    }
                  },
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Verified Profile",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
            Card(
              color: const Color.fromARGB(255, 245, 243, 243),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  " Orders",
                  style: TextStyle(color: Colors.grey[500], fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.wb_sunny_outlined),
            ),
            Text(
              "Dark Mode",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Switch(value:BlocProvider.of<ThemeCubit>(context).state==ThemeMode.dark , onChanged: (value) {
BlocProvider.of<ThemeCubit>(context).toggle();

              }),
            ),
          ],
        ),
        CustomItemInDrawer(text: "Account Information", icon: Icons.info_outline),
        CustomItemInDrawer(text: "Password", icon: Icons.lock_outline),
        CustomItemInDrawer(text: "My Card", icon: Icons.credit_card),
        CustomItemInDrawer(text: "Wishlist", icon: Icons.favorite_outline),
        CustomItemInDrawer(text: "Settings", icon: Icons.settings_outlined),
        Spacer(),
        CustomItemInDrawer(text: "Log Out", icon: Icons.logout),
      ],
    );
  }
}
