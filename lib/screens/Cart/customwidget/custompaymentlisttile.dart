
import 'package:flutter/material.dart';

class CustomListtileCard extends StatelessWidget {
  const CustomListtileCard({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title, required this.onTap,
  });
  final String image;
  final String subTitle;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Card(
        // color: Color(0xffEDE9FE),
    color: Theme.of(context).cardColor,

        child: ListTile(
          leading: Image.asset(image, width: 50),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Icon(Icons.check_circle, color: Colors.green),
        ),
      ),
    );
  }
}
