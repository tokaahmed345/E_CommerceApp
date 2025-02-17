import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductModel/product.dart';
import 'package:lazashopping/screens/Category/customwidgets/customgridview.dart';
import 'package:lazashopping/services/productservices/productservcies.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});
  static String id = "CategoryHome";

  @override
  Widget build(BuildContext context) {
    ProductServces productServces = ProductServces();
    final String productCategory =
        ModalRoute.of(context)!.settings.arguments as String;

    // Get screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600; // Define small screen for responsiveness

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            )),
        elevation: 0,
       
      ),
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0), // Adjust padding based on screen size
        child: FutureBuilder<List<Product>>(
          future: productServces.getCategory(id: productCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No products found"));
            } else {
              List<Product> productCategoryId = snapshot.data!;
              return SingleChildScrollView(
                child: CustomGridView(
                  products: productCategoryId,
                  // Adjust number of columns based on screen width
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
