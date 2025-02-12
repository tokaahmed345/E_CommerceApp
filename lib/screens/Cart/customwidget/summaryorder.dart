import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/calculate_total_cubit.dart';
import 'package:lazashopping/screens/Cart/customwidget/customorderrow.dart';

class SummaryOrderInfo extends StatelessWidget {
  const SummaryOrderInfo({
    super.key,
    required this.items,
  });
  final List<dynamic> items;
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => CalculateTotalCubit()..updateTotal(items),
      child: BlocBuilder<CalculateTotalCubit, CalculateTotalState>(
        builder: (context, state) {
          if(state is CalculateTotalSuccess){
             return Card(
            color:   Theme.of(context).scaffoldBackgroundColor,

            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomOrderSection(
                      label: "Subtotal",
                      value: "\$${ state. subtotal.toStringAsFixed(2)}"),
                  CustomOrderSection(label: "ShippingCost", value: "\$10"),
                  Divider(),
                  CustomOrderSection(
                    label: "Total",
                    value: "\$${ (state. subtotal + 10).toStringAsFixed(2)}",
                    isBold: true,
                  ),
                ],
              ),
            ),
          );
          }
         return CircularProgressIndicator();
        },
      ),
    );
  }
}