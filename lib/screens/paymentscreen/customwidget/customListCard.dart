
import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  const CustomListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset("assets/images/Card 1.png"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
