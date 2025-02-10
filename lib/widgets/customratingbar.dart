import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatefulWidget {
  const CustomRatingBar({super.key, this.rating});
   final   double ?rating;

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
double rating =2.5;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
  initialRating: widget.rating??2.5,
  minRating: 1,
  itemSize: 20,
  itemCount: 5,
  allowHalfRating: true,
  itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,), 
  onRatingUpdate:(Value){
    setState(() {
    rating =Value
;
    });
  } ) ;
  }
}