
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffEDE9FE),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(title, style: TextStyle(color: Colors.black)),
      centerTitle: true,
    );
  
  
  }
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
