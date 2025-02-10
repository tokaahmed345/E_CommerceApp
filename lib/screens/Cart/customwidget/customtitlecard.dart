
import 'package:flutter/material.dart';

class CustomTitleCard extends StatelessWidget {
  const CustomTitleCard({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
