
import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/screens/AllReview/reviewsscreen.dart';
import 'package:lazashopping/widgets/custom-item-shape.dart';
import 'package:lazashopping/widgets/custom_row_size_section.dart';
import 'package:lazashopping/widgets/customcolumnreview.dart';

class CustomInfoBody extends StatelessWidget {
  const CustomInfoBody({
    super.key,
    required this.itemdetails,
    required this.textScaleFactor,
    required this.screenHeight,
  });

  final ItemInfo itemdetails;
  final double textScaleFactor;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  itemdetails.name ?? "SportProduct",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 19 * textScaleFactor),
                ),
              ),
              Text(
                "price",
                style: TextStyle(
                    color: Colors.grey, fontSize: 18 * textScaleFactor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemdetails.categoryId ?? " ",
                style: TextStyle(
                    fontSize: 20 * textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${itemdetails.price}",
                style: TextStyle(
                    fontSize: 20 * textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight *
                0.09, // Dynamic height for images based on screen height
            child: ListView.builder(
              itemCount: itemdetails.images!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String image = itemdetails.images![index].image ?? "";
                return Row(
                  children: [
                    CustomSideItem(
                      image: image,
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: TextStyle(
                    fontSize: 22 * textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Size Guide",
                style: TextStyle(
                    color: Colors.grey, fontSize: 20 * textScaleFactor),
              ),
            ],
          ),
          CustomRowSizeSection(),
          SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22 * textScaleFactor),
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  
                  text: itemdetails.description,
                  
                  style: TextStyle(
                    
                      fontSize: 20 * textScaleFactor, color: Colors.grey),
                ),
                TextSpan(
                  text: "ReadMore..",
                  style: TextStyle(
                      fontSize: 20 * textScaleFactor,
                      fontWeight: FontWeight.bold),
                ),
              ])),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: TextStyle(
                    fontSize: 22 * textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ReviewsScreen.id,
                      arguments: itemdetails.id);
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 20 * textScaleFactor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                (itemdetails.reviews != null && itemdetails.reviews!.isNotEmpty)
                    ? ReviewSection(info: itemdetails.reviews!.first)
                    : SizedBox(),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 22 * textScaleFactor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "with VAT, SD",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 147, 146, 146),
                          fontSize: 17 * textScaleFactor),
                    ),
                  ],
                ),
                Text(
                  "\$${itemdetails.price}",
                  style: TextStyle(fontSize: 20 * textScaleFactor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
