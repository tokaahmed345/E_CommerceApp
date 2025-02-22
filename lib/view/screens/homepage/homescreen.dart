import 'package:flutter/material.dart';
import 'package:lazashopping/view/screens/Cart/cart-screen.dart';
import 'package:lazashopping/view/screens/homepage/customwidget/custom_ProductFutureHome.dart';
import 'package:lazashopping/view/screens/homepage/customwidget/custombottomnavigatio.dart';
import 'package:lazashopping/view/screens/homepage/customwidget/customcolumndrawer.dart';
import 'package:lazashopping/widgets/customsearch.dart';
import 'package:lazashopping/widgets/listviewhomecategory.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "homescreen";
  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeTitle = screenWidth * 0.09; // Title font size
    double fontSizeSubTitle = screenWidth * 0.06; // Subtitle font size
    double iconSize = screenWidth * 0.08; // Icon size
    double padding = screenWidth * 0.03; // Padding based on screen width

    final TextEditingController controller = TextEditingController();
    final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: globalKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu, size: iconSize),
                  onPressed: () {
                    globalKey.currentState?.openDrawer();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_bag_outlined, size: iconSize),
                  onPressed: () {
                    Navigator.pushNamed(context, CartView.id);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Hello",
              style: TextStyle(
                  fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome to Laza",
              style: TextStyle(color: Colors.grey, fontSize: fontSizeSubTitle),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomSearch(controller: controller),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Choose Brand",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: fontSizeSubTitle),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListViewHomeCategory(),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrival",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSizeSubTitle),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.grey, fontSize: fontSizeSubTitle * 0.8),
                )
              ],
            ),
            const SizedBox(height: 10),
            CustomFutureHomeProduct()
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: padding),
          child: const CustomColumnDrawer(),
        ),
      ),
    );
  }
}
