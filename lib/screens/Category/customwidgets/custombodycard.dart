
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lazashopping/model/WishListModel/getallwishlist.dart';
import 'package:lazashopping/screens/detailsproduct.dart/info_screen.dart';
import 'package:lazashopping/services/addwishlist/addwishlist_services.dart';
import 'package:lazashopping/services/getallwishlist/getalluserwishlist.dart';
import 'package:lazashopping/services/removewishlist/removewishlist.dart';

class CustomCardContent extends StatefulWidget {
  final dynamic pro; // يمكن أن يكون Product أو GetAllUserWishList
  const CustomCardContent({super.key, required this.pro});

  @override
  State<CustomCardContent> createState() => _CustomCardContentState();
}
class _CustomCardContentState extends State<CustomCardContent> {
   bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  Future<void> checkIfFavorite() async {
    try {
      List<GetAllUserWishList> wishlist =
          await GetUserWishListServices().getAllWishList() ?? [];

      setState(() {
        isFavorite =
            wishlist.any((item) => item.id == widget.pro.id);
      });
    } catch (e) {
      print("❌ Error checking wishlist: $e");
    }
  }
Future<void> toggleWishlist() async {
  try {
    if (!isFavorite) {
      // إضافة إلى المفضلة
      await AddWishlListServices().addWishList(
        productId: widget.pro.id!,
        name: widget.pro.name!,
        img: widget.pro.img!,
        price: widget.pro.price!,
      );
      setState(() {
        isFavorite = true;
      });
    } else {
      // إزالة من المفضلة
      var removedItems = await RemoveWishlListServices().removeWishList(
        productId: widget.pro.id!,
        name: widget.pro.name!,
        img: widget.pro.img!,
        price: widget.pro.price!,
      );
      print("Removed Wishlist Items successfully");

      setState(() {
        isFavorite = false;
      });
    }
  } catch (e) {
    print("❌ Error: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const String baseUrl = "https://laza.runasp.net/";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, InfoCard.id,
                    arguments: widget.pro);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: "$baseUrl${widget.pro.img}",
                    width: screenWidth * 0.45,
                    height: screenHeight * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: toggleWishlist,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? const Color.fromARGB(255, 174, 100, 243)
                      : Colors.black,
                  size: screenWidth * 0.06,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.pro.name ?? "Clothing",
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.pro.description ?? "Sport Product",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "\$${widget.pro.price}",
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}