import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Orders/getallorders.dart';
import 'package:lazashopping/screens/homepage/homescreen.dart';
import 'package:lazashopping/screens/wishlist/wishlist.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get the screen width to make adjustments for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04; // Font size for labels based on screen width
    double iconSize = screenWidth * 0.08; // Icon size based on screen width

    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(fontSize: fontSize),
      selectedFontSize: fontSize,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
        if (index == 1) {
          Navigator.pushNamed(context, WishListScreen.id);
        }
        if (index == 0) {
          Navigator.pushNamed(context, HomeScreen.id);
        }
        if (index == 3) {
          Navigator.pushNamed(context, GetOrders.id);
        }
      },
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: selectedIndex == 0
              ? SizedBox.shrink()
              : Icon(Icons.home_outlined, size: iconSize),
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 1
              ? SizedBox.shrink()
              : Icon(Icons.favorite_outline, size: iconSize),
          label: "Wishlist",
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 2
              ? SizedBox.shrink()
              : Icon(Icons.credit_card, size: iconSize),
          label: "Card",
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 3
              ? SizedBox.shrink()
              : Icon(Icons.shopping_bag_outlined, size: iconSize),
          label: "Order",
        ),
      ],
    );
  }
}
