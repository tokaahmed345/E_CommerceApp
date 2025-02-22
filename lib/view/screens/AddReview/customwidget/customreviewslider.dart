import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final Function(double) onRatingChanged;
  const CustomSlider({super.key, required this.onRatingChanged});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

double rating = 0.0;

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double textFontSize = screenWidth < 400 ? 14 : 18;

    double sliderWidth = screenWidth * 0.7;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${rating.toStringAsFixed(1)}",
          style: TextStyle(fontSize: textFontSize),
        ),
        Expanded(
          child: Container(
            width: sliderWidth,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorColor: const Color.fromARGB(255, 92, 81, 161),
              ),
              child: Slider(
                value: rating,
                min: 0.0,
                max: 5.0,
                divisions: 10,
                label: " ${rating.toStringAsFixed(1)}",
                onChanged: (double value) {
                  setState(() {
                    rating = value;
                  });
                  widget.onRatingChanged(value);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
