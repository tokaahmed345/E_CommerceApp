import 'package:flutter/material.dart';

import 'package:lazashopping/model/WishListModel/getallwishlist.dart';
import 'package:lazashopping/screens/Category/customwidgets/customgridview.dart';
import 'package:lazashopping/screens/homepage/customwidget/custombottomnavigatio.dart';
import 'package:lazashopping/screens/wishlist/customwidgets/customtitlerow.dart';
import 'package:lazashopping/screens/wishlist/customwidgets/customwishlistinfo.dart';
import 'package:lazashopping/services/getallwishlist/getalluserwishlist.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static String id = 'wishlist';
  Future<List<GetAllUserWishList>> fetchAllWishList() async {
    return await GetUserWishListServices().getAllWishList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDE9FE),
      body: Column(
        children: [
          CustomWishListTitleRow(),
          Expanded(
              child: FutureBuilder<List<GetAllUserWishList>>(
            future: fetchAllWishList(),
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
                return Column(
                  children: [
                    CustomInfoWishlist(
                      wishlist: result,
                    ),
                    CustomGridView(
                      products: result.map((e) => e.toProduct()).toList(),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text("No data available"));
              }
            },
          )),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
