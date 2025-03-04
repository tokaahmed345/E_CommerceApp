import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/get_all_item_in_cart_cubit.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/quantity_control_cubit.dart';
import 'package:lazashopping/services/cartServices/delete_item_by_id.dart';

class CustomCardCart extends StatelessWidget {
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final productid;

  const CustomCardCart({
    super.key,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    required this.productid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityControlCubit(),
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.02),
          child: Row(
            children: [
              Image.network(
                "https://laza.runasp.net/$productImage", // تأكد من مسار الصورة الصحيح
                width: MediaQuery.of(context).size.width *
                    0.3, // Make image responsive
                height: MediaQuery.of(context).size.height *
                    0.1, // Make image responsive
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width *
                            0.04, // Make font size responsive
                      ),
                    ),
                    Text(
                      "\$$price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width *
                            0.04, // Make font size responsive
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    BlocBuilder<QuantityControlCubit, QuantityControlState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                child: IconButton(
                                  icon: const Icon(Icons.keyboard_arrow_up,
                                      color: Colors.grey),
                                  onPressed: () {
                                    BlocProvider.of<QuantityControlCubit>(
                                            context)
                                        .increaseQuantity();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Text(
                                state.quantity.toString(),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04, // Make font size responsive
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                child: IconButton(
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: Colors.grey),
                                  onPressed: () {
                                    BlocProvider.of<QuantityControlCubit>(
                                            context)
                                        .decreaceQuantity();
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.grey),
                              onPressed: () async {
                                await DeleteItemByIdServices()
                                    .deleteItemById(id: productid);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 231, 85, 209),
                                    content: Text("Item removed SuccessFully"),
                                  ),
                                );
                                BlocProvider.of<GetAllItemInCartCubit>(context)
                                    .getAllItemsInCart();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
