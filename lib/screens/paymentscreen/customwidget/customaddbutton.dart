
import 'package:flutter/material.dart';
import 'package:lazashopping/screens/paymentscreen/addnewcard.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, AddNewCard.id);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 35,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 119, 79, 242))),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add new card",
                style: TextStyle(
                    color: Color(0xffa98dfb),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 2,
                color: Color.fromARGB(255, 183, 169, 230))),
      ),
    );
  }
}
