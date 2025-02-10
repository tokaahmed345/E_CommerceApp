
import 'package:flutter/material.dart';
import 'package:lazashopping/model/WishListModel/getallwishlist.dart';

class CustomInfoWishlist extends StatelessWidget {
  const CustomInfoWishlist({
    super.key, required this.wishlist,
  });
 final     List< GetAllUserWishList> wishlist;


  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [Text(" ${wishlist.length}  items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Text("in wishlist",style: TextStyle(color: Colors.grey,fontSize: 15)),),
         ]  ),
       ),
           
           Container(
    padding: EdgeInsets.all(20),
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
     child: Row(children: [Padding(
       padding: const EdgeInsets.only(right: 8.0),
       child: Icon(Icons.edit,size: 20,),
     ),Text("Edit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)],),),
            
    ],);
  }
}
