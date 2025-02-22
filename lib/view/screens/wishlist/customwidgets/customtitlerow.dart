import 'package:flutter/material.dart';

class CustomWishListTitleRow extends StatelessWidget {
  const CustomWishListTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust layout for smaller screen sizes (e.g., mobile)
    bool isSmallScreen = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          isSmallScreen
              ? const Text(
                  "Wishlist",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              : const Text(
                  "Wishlist",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
