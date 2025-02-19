import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // لاستعمال TapGestureRecognizer
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/screens/AllReview/reviewsscreen.dart';
import 'package:lazashopping/widgets/custom-item-shape.dart';
import 'package:lazashopping/widgets/custom_row_size_section.dart';
import 'package:lazashopping/widgets/customcolumnreview.dart';

class CustomInfoBody extends StatefulWidget {
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
  _CustomInfoBodyState createState() => _CustomInfoBodyState();
}

class _CustomInfoBodyState extends State<CustomInfoBody> {
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final String description = widget.itemdetails.description ?? "";
    final String truncatedDescription = description.length > 100
        ? description.substring(0, 100) + "..."
        : description;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.itemdetails.name ?? "SportProduct",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 19 * widget.textScaleFactor),
                ),
              ),
              Text(
                "price",
                style: TextStyle(
                    color: Colors.grey, fontSize: 18 * widget.textScaleFactor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.itemdetails.categoryId ?? " ",
                style: TextStyle(
                    fontSize: 20 * widget.textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${widget.itemdetails.price}",
                style: TextStyle(
                    fontSize: 20 * widget.textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: widget.screenHeight *
                0.09, // Dynamic height for images based on screen height
            child: ListView.builder(
              itemCount: widget.itemdetails.images!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String image = widget.itemdetails.images![index].image ?? "";
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
                    fontSize: 22 * widget.textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Size Guide",
                style: TextStyle(
                    color: Colors.grey, fontSize: 20 * widget.textScaleFactor),
              ),
            ],
          ),
          const CustomRowSizeSection(),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22 * widget.textScaleFactor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text:
                      _showFullDescription ? description : truncatedDescription,
                  style: TextStyle(
                      fontSize: 20 * widget.textScaleFactor,
                      color: Colors.grey),
                ),
                TextSpan(
                  text: _showFullDescription ? " Show Less" : " Read More",
                  style: TextStyle(
                      fontSize: 20 * widget.textScaleFactor,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _showFullDescription = !_showFullDescription;
                      });
                    },
                ),
              ])),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: TextStyle(
                    fontSize: 22 * widget.textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ReviewsScreen.id,
                      arguments: widget.itemdetails.id);
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20 * widget.textScaleFactor),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (widget.itemdetails.reviews != null &&
                    widget.itemdetails.reviews!.isNotEmpty)
                ? ReviewSection(info: widget.itemdetails.reviews!.first)
                : const SizedBox(),
          ),
          const SizedBox(
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
                          fontSize: 22 * widget.textScaleFactor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "with VAT, SD",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 147, 146, 146),
                          fontSize: 17 * widget.textScaleFactor),
                    ),
                  ],
                ),
                Text(
                  "\$${widget.itemdetails.price}",
                  style: TextStyle(fontSize: 20 * widget.textScaleFactor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
