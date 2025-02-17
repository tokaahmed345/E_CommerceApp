
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
  backgroundColor:  Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).appBarTheme.iconTheme!.color),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(title, style: TextStyle(fontSize: 22,color: Theme.of(context).appBarTheme.iconTheme!.color)),
      centerTitle: true,
    );
  
  
  }
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
