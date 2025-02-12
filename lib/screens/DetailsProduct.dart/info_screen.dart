import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/model/ProductModel/product.dart';

import 'package:lazashopping/screens/DetailsProduct.dart/customwedgit/customcolumn_item_infocard.dart';
import 'package:lazashopping/services/productInfoServices/iteminfoservces.dart';


class InfoCard extends StatefulWidget {
  const InfoCard({super.key});
  static String id = "infobody";

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    ItemInfo itemdetails = ItemInfo();
    ItemInfoServces itemServces = ItemInfoServces();
    final Product productId =ModalRoute.of(context)!.settings.arguments as Product;
    Future<ItemInfo?> getData() async{
      return await itemServces.getProductInfo(productId);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: FutureBuilder<ItemInfo?>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData ) {
                var  result=snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: CustomColumninfoCard(itemdetails: result),
                );
              } else if (snapshot.hasError) {
                return Text("Error${snapshot.error.toString()}");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Text("has nno data ");
              }
            }));
  }
}


