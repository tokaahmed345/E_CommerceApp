
import 'package:flutter/material.dart';

class CustomItemInDrawer extends StatelessWidget {
  const CustomItemInDrawer({
    super.key, required this.text, required this.icon,
  });
 final  String text ;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [Icon(icon),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,style: TextStyle(fontSize: 20),),
      )],),
    );
  }
}
