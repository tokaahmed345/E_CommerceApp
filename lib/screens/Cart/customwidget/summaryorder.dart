
import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customorderrow.dart';

class SummaryOrderInfo extends StatelessWidget {
  const SummaryOrderInfo({
    super.key, required this.items,
  });
 final List<dynamic> items; 
  @override
  Widget build(BuildContext context) {
        double subtotal = items.fold(0, (sum, num) => sum + (num["Price"] * num["Quantity"]));

    return Card(
      color: Color(0xffEDE9FE),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
             CustomOrderSection(  label:    "Subtotal",value:  "\$${subtotal.toStringAsFixed(2)}"),
                CustomOrderSection(  label:    "ShippingCost",value:  "\$10"),
              Divider(),
                CustomOrderSection(  label:    "Total",value:  "\$${(subtotal+10).toStringAsFixed(2)}",isBold: true,),
    
          ],
        ),
      ),
    );
  }
}
