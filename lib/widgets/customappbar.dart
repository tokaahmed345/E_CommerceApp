
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffEDE9FE),
      elevation: 0,
      leading: CircleAvatar(
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
    );
  }
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}
