
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
    final String productCategory = ModalRoute.of(context)!.settings.arguments as String;

    

    return Scaffold(
      backgroundColor: Color(0xffEDE9FE),
      appBar: AppBar(
        // backgroundColor: Color(0xff9775fa),
       backgroundColor: Color(0xffEDE9FE),
leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        elevation: 0,
        // title: Text("Category:$productCategory"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
              return SingleChildScrollView(child: CustomGridView(products: productCategoryId)); 
            }
          },
        ),
      ),
    );
  }
}
