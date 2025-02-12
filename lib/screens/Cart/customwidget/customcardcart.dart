import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/calculate_total_cubit.dart';
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
        color: Color(0xffEDE9FE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Image.network(
                "https://laza.runasp.net/$productImage", // تأكد من مسار الصورة الصحيح
                width: 80,
                height: 80,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("\$$price",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
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
                                backgroundColor: Color(0xffEDE9FE),
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_up,
                                      color: Colors.grey),
                                  onPressed: () {
                                    BlocProvider.of<QuantityControlCubit>(
                                            context)
                                        .increaseQuantity();
                       
                                  }
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(state.quantity.toString(),
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffEDE9FE),
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      color: Colors.grey),
                                  onPressed: () {
                                    BlocProvider.of<QuantityControlCubit>(
                                            context)
                                        .decreaceQuantity();
 


                                  },
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.delete_outline,
                                  color: Colors.grey),
                              onPressed: ()async {
                            await    DeleteItemByIdServices()
                                    .deleteItemById(id: productid);
                                    
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 231, 85, 209),
                                        content:
                                            Text("Item removed SuccessFully")));
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
