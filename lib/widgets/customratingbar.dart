import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatefulWidget {
  const CustomRatingBar({super.key, this.rating});

  final double? rating;

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.rating ?? 2.5;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemSize = screenWidth * 0.05;

    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      itemSize: itemSize,
      itemCount: 5,
      allowHalfRating: true,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (value) {
        setState(() {
          rating = value;
        });
      },
    );
  }
}
