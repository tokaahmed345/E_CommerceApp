import 'package:flutter/material.dart';
import 'package:lazashopping/model/WishListModel/getallwishlist.dart';

class CustomInfoWishlist extends StatelessWidget {
  const CustomInfoWishlist({
    super.key,
    required this.wishlist,
  });
  final List<GetAllUserWishList> wishlist;

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust layout for smaller screens
    bool isSmallScreen = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " ${wishlist.length}  items",
                style: TextStyle(
                  fontSize: isSmallScreen ? 18 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Text(
                  "in wishlist",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isSmallScreen ? 17 : 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
