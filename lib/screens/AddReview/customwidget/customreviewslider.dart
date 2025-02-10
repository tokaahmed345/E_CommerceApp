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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${rating.toStringAsFixed(1)}"),

        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
                valueIndicatorColor: const Color.fromARGB(255, 92, 81, 161)),
            child: Slider(
              value: rating,
              min: 0.0,
              activeColor: Color(0xff9775fa),
              max: 5.0,
              divisions: 10,
              label: " ${rating.toStringAsFixed(1)}",
              onChanged: (double value) {
                setState(() {
                  rating = value; // تغيير التقييم عند سحب الشريط
                });
                widget.onRatingChanged(value); // تحديث القيمة في الـ Callback
              },
            ),
          ),
        ),
      ],
    );
  }
}
