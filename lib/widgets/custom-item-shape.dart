
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSideItem extends StatelessWidget {
  const CustomSideItem({
    super.key, required this.image,
  });
final  String image;

  @override
  Widget build(BuildContext context) {
            String baseUrl= "https://laza.runasp.net/";

    return Card(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 110,
        height: 90,
        child: CachedNetworkImage(imageUrl:"$baseUrl$image",fit: BoxFit.fill)));
  }
}