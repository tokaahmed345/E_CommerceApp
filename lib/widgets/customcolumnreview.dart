import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/widgets/customratingbar.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.info});
    final  Review info;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    children: [
  // CircleAvatar(
  //   backgroundColor: Colors.grey[200],
  //   maxRadius: 25,
  //   child: Image(image: AssetImage("assets/images/Rectangle 568 (1).png"))),
  Column(children: [Text(info.username??"No User Found",style: TextStyle(fontSize: 17),),
      // Text("13,Sep,2020",style: TextStyle(color: Colors.grey),),],),
    
    Text(
    style: TextStyle(fontSize: 22,color: Colors.grey),
  info.feedback??"No Feedback")  
    
    ]),
      Column(children: [
        Text.rich(TextSpan(children: 
        [
          TextSpan(text:  info.rating?.toStringAsFixed(1)??"2.5",style: TextStyle(fontSize: 18)),
          TextSpan(text: " rating",style: TextStyle(color: Colors.grey,fontSize: 17)),
  
        ])),
        
CustomRatingBar(rating: info.rating,)
    ],)
  ],),
  
  ],);
  }
}