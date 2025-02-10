
import 'package:flutter/material.dart';

class Custombar extends StatelessWidget {
  const Custombar({
    super.key, required this.title, required this.number,
  });
final String title;
final double number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffEDE9FE),
              foregroundColor: Colors.black,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ))),
      Padding(
        padding: EdgeInsets.only(right: number),
        child: Text(title,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 35),),
      )
    ],);
  }
}