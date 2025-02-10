
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomStackItem extends StatelessWidget {
  const CustomStackItem({
    super.key, required this.img,
  });
  final String img;
// assets/images/Rectangle 568.png
  @override
  Widget build(BuildContext context) {
        String baseUrl= "https://laza.runasp.net/";

    return Stack(
      children: [
        Container(
        width: double.infinity,
        child: CachedNetworkImage(imageUrl: "$baseUrl$img",fit: BoxFit.cover,),),
     SizedBox(height: 20,),
     Positioned(
     
      child: 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,))),
         CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,))),
        
        
        ],),
      ), )
      ],
    );
  }
}

