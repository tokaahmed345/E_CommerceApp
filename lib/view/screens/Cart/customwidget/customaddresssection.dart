

import 'package:flutter/material.dart';

class CustomAddressSection extends StatelessWidget {
  const CustomAddressSection({
    super.key,
    required this.subTitle,
    required this.title, this.onTap,
  });
  final String subTitle;
  final String title;
final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).cardColor,

        child: ListTile(
          leading: const Icon(Icons.location_on, color: Colors.orange),
          title: Text(title),
          subtitle: Text(subTitle),
trailing: (title.isEmpty || title == "Click to add address")
              ? const SizedBox() 
              : const Icon(Icons.check_circle, color: Colors.green),        ),
      ),
    );
  }
}