
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductModel/product.dart';
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
  final String baseUrl = "https://laza.runasp.net/";

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  Future<void> checkIfFavorite() async {
  try {
    List<GetAllUserWishList> wishlist =
        await GetUserWishListServices().getAllWishList() ?? [];
    
    if (widget.pro is Product) {
      bool favorite = wishlist.any((item) => item.id == (widget.pro as Product).id);
      setState(() {
        isFavorite = favorite;
      });
    }
  } catch (e) {
    print("❌ Error checking wishlist: $e");
  }
}

Future<void> toggleWishlist() async {
  try {
    if (widget.pro is Product) {
      Product product = widget.pro as Product;

      if (!isFavorite) {
        await AddWishlListServices().addWishList(
          productId: product.id!,
          name: product.name!,
          img: product.img!,
          price: product.price!,
        );
      } else {
        await RemoveWishlListServices().removeWishList(
          productId: product.id!,
          name: product.name!,
          img: product.img!,
          price: product.price!,
        );
      }

      setState(() {
        isFavorite = !isFavorite;
      });
    }
  } catch (e) {
    setState(() {
      isFavorite = !isFavorite; // إرجاع الحالة الأصلية في حالة الخطأ
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                    imageUrl: widget.pro is Product?
                    
                    
                    "$baseUrl${(widget.pro as Product).img }":"",
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