
import 'package:flutter/material.dart';

class CustomRecord extends StatelessWidget {
  const CustomRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xff9775fa),
              border: Border.all(width: .1),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: Colors.white,
                size: 35,
              ))),
    );
  }
}