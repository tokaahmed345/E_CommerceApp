

import 'package:flutter/material.dart';

class AccountInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const AccountInfoCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Card(
        elevation: 10,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$label: ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: const Color.fromARGB(255, 198, 49, 49),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: const Color.fromARGB(255, 195, 85, 231),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
