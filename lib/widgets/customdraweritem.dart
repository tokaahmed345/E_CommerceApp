
import 'package:flutter/material.dart';

class CustomItemInDrawer extends StatelessWidget {
  const CustomItemInDrawer({
    super.key, required this.text, required this.icon, this.color,this.onTap
  });
 final  String text ;
final IconData icon;
final Color ?color;
final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [Icon(icon,color: color,),Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,style: TextStyle(fontSize: 20),),
        )],),
      ),
    );
  }
}
