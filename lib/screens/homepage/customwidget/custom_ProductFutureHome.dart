
import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductModel/product.dart';
import 'package:lazashopping/screens/Category/customwidgets/customgridview.dart';
import 'package:lazashopping/services/productservices/productservcies.dart';

class CustomFutureHomeProduct extends StatelessWidget {
  CustomFutureHomeProduct({super.key});
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
            return const Center(
              child:  Text(
                "No data available",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return CustomGridView(products: result!);
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }
}