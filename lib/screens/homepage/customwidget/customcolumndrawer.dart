import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/Theme/theme_cubit_cubit.dart';
import 'package:lazashopping/screens/drawersScreens/account_Info.dart';
import 'package:lazashopping/screens/drawersScreens/display_Password.dart';
import 'package:lazashopping/screens/welcomescreen.dart';
import 'package:lazashopping/screens/wishlist/wishlist.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customdraweritem.dart';

class CustomColumnDrawer extends StatelessWidget {
  const CustomColumnDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.02; // 5% of screen width
    double fontSize = screenWidth * 0.04; 
       double iconSize = screenWidth * 0.07;
           double fontSizeItem = screenWidth * 0.05; // Adjust font size based on screen width
 // Adjust font size based on screen width

    return Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.1), // Adjust bottom padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 190,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.person, color: Color.fromARGB(255, 124, 58, 222), size: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String>(
                  future: SharedPref.getUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading...", style: TextStyle(fontSize: fontSize, color: Colors.grey));
                    } else if (snapshot.hasError) {
                      return Text("Error", style: TextStyle(fontSize: fontSize, color: Colors.red));
                    } else {
                      return Text(
                        snapshot.data ?? "Guest",
                        style: TextStyle(fontSize: fontSize),
                      );
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Text("Verified Profile", style: TextStyle(color: Colors.grey, fontSize: fontSize * 0.9)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.verified, color: Colors.green, size: fontSize * 0.8),
                    ),
                  ],
                ),
              ],
            ),
            Card(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Text(" Orders", style: TextStyle(color: Colors.grey[500], fontSize: fontSize)),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Icon(Icons.wb_sunny_outlined, size: iconSize),
            ),
            Text("Dark Mode", style: TextStyle(fontSize: fontSizeItem)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Switch(
                value: BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark,
                onChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context).toggle();
                },
              ),
            ),
          ],
        ),
        CustomItemInDrawer(text: "Account Information", icon: Icons.info_outline, onTap: () { Navigator.pushNamed(context, AccountInfoScreen.id); }),
        CustomItemInDrawer(text: "Password", icon: Icons.lock_outline, onTap: () { Navigator.pushNamed(context, DisplayPasswordScreen.id); }),
        CustomItemInDrawer(text: "Wishlist", icon: Icons.favorite_outline, onTap: () { Navigator.pushNamed(context, WishListScreen.id); }),
        // CustomItemInDrawer(text: "Settings", icon: Icons.settings_outlined),
        const Spacer(),
        CustomItemInDrawer(
          text: "Log Out",
          icon: Icons.logout,
          color: Colors.red,
          onTap: () async {
            await SharedPref.removeToken();
            print("logout");
            print(SharedPref.getToken());
            Navigator.pushNamedAndRemoveUntil(context, Welcome_Screen.id, (Route<dynamic> route) => false);
          },
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
