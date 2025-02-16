
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).cardColor,
          foregroundColor:Theme.of(context).appBarTheme.foregroundColor,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ))),
    );
  }
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}
