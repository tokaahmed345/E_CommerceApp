import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';

class CustomAnimatedRatingBar extends StatefulWidget {
  const CustomAnimatedRatingBar({super.key, });

  @override
  State<CustomAnimatedRatingBar> createState() => _CustomAnimatedRatingBarState();
}
class _CustomAnimatedRatingBarState extends State<CustomAnimatedRatingBar> {
double rating=3;
  
  @override
  Widget build(BuildContext context) {
    return   AnimatedRatingStars(
    initialRating: rating,
    onChanged: (value){
      setState(() {
          rating=value; 
  
      });
    }, 
   customHalfFilledIcon: Icons.star_half,
  customFilledIcon: Icons.stars
  , customEmptyIcon: Icons.star_border,
   displayRatingValue: true, 
                    interactiveTooltips: true, 
  );
  }
}