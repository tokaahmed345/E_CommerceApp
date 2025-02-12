import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/wishist/wish_list_cubit.dart';
import 'package:lazashopping/model/ProductModel/product.dart';
import 'package:lazashopping/screens/Homepage/customwidget/custombottomnavigatio.dart';
import 'package:lazashopping/screens/Homepage/customwidget/customcolumndrawer.dart';
import 'package:lazashopping/screens/Category/customwidgets/customgridview.dart';
import 'package:lazashopping/services/productservices/productservcies.dart';
import 'package:lazashopping/widgets/customsearch.dart';
import 'package:lazashopping/widgets/listviewhomecategory.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "homescreen";
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
    ProductServces pro = ProductServces();
    return Scaffold(
      key: globalKey,
      // backgroundColor: Color(0xffEDE9FE),
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    globalKey.currentState?.openDrawer();
                  },
                ),
                Icon(Icons.shopping_bag_outlined),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hello",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome to Laza",
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            CustomSearch(controller: controller),
            SizedBox(
              height: 10,
            ),
            Text(
              "Choose Brand",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(
              height: 10,
            ),
            ListViewHomeCategory(),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrival",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Text(
                  "View All",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                )
              ],
            ),
            SizedBox(height: 10),
            CustomFutureHomeProduct()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
          child: CustomColumnDrawer(),
        ),
      ),
    );
  }
}

class CustomFutureHomeProduct extends StatelessWidget {
  CustomFutureHomeProduct({
    super.key,
  });
  final ProductServces pro = ProductServces();
  Future<List<Product>> getProduct() {
    return pro.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: getProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var result = snapshot.data;
          if (result == null || result.isEmpty) {
            return Center(
                child: Text(
              "No data available",
              style: TextStyle(color: Colors.red),
            ));
          }
          return CustomGridView(products: result!);
        } else if (snapshot.hasError) {
          // Show SnackBar after widget is built
          Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text("No data available"));
        }
        return Text("Error");
      },
    );
  }
}
