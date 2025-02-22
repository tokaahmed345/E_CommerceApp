import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.06; // تعديل المضاعف حسب الحاجة
    double iconSize = screenWidth * 0.07; // تعديل المضاعف حسب الحاجة

    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: iconSize, // تعديل حجم الأيقونة بناءً على عرض الشاشة
          color: Theme.of(context).appBarTheme.iconTheme!.color,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize, // تعديل حجم الخط بناءً على عرض الشاشة
          color: Theme.of(context).appBarTheme.iconTheme!.color,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
