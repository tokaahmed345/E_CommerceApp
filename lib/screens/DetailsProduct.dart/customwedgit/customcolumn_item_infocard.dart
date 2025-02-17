import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/add_to_cart_cubit.dart';
import 'package:lazashopping/helpers/helper.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/screens/Cart/cart-screen.dart';
import 'package:lazashopping/screens/DetailsProduct.dart/customwedgit/custom_info_bode.dart';
import 'package:lazashopping/services/cartServices/add_to_cart.dart';
import 'package:lazashopping/services/cartServices/getallservices.dart';

import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customstackitem.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomColumninfoCard extends StatelessWidget {
  const CustomColumninfoCard({
    super.key,
    required this.itemdetails,
  });

  final ItemInfo itemdetails;

  @override
  Widget build(BuildContext context) {
    // Future<Map<String, dynamic>> addProduct() async {
    //   try {
    //     final response = await GetAllItemInCartServices().getAllItemInCart();
    //     List<dynamic> itemInCart = response["Items"] ?? [];
    //     bool isProductInCart =
    //         itemInCart.any((item) => item["ProductId"] == itemdetails.id);
    //     if (isProductInCart) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           backgroundColor: const Color.fromARGB(255, 198, 105, 235),
    //           content: Text("هذا المنتج موجود بالفعل في السلة!"),
    //         ),
    //       );

    //       Navigator.pushNamed(context, CartView.id);
    //     } else {
    //       final response = await AddToCartServices().addToCart(
    //         ProductId: itemdetails.id ?? "",
    //         ProductName: itemdetails.name ?? "",
    //         ProductImg: itemdetails.img ?? "",
    //         Price: itemdetails.price ?? 0.0,
    //         quantity: 1,
    //       );

    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           backgroundColor: Colors.green,
    //           content: Text("تمت الإضافة إلى السلة بنجاح!"),
    //         ),
    //       );

    //       Navigator.pushNamed(context, CartView.id);
    //       return response;
    //     }
    //   } catch (e) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         backgroundColor: Colors.red,
    //         content: Text("فشل الإضافة إلى السلة: $e"),
    //       ),
    //     );
    //     print("❌ خطأ أثناء إضافة المنتج: $e");
    //   }
    //   return {"message": "فشل الإضافة إلى السلة"};
    // }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textScaleFactor = screenWidth > 600 ? 1.2 : 1.0;

    return BlocProvider(
      create: (context) => AddToCartCubit(
          addServices: AddToCartServices(),
          getAllItemInCartServices: GetAllItemInCartServices()),
      child: Column(
        children: [
          CustomStackItem(
            img: itemdetails.img ?? "",
          ),
          CustomInfoBody(
              itemdetails: itemdetails,
              textScaleFactor: textScaleFactor,
              screenHeight: screenHeight),
          BlocConsumer<AddToCartCubit, AddToCartState>(
            listener: (context, state) {
              if (state is AddToCartLoading) {
                Center(child: CircularProgressIndicator());
              } else if (state is AddToCartFailure) {
                          Helpers.showSnackbar(context, state.message,backgroundColor:  const Color.fromARGB(255, 231, 85, 209));

                Navigator.pushNamed(context, CartView.id);
              } else {
            Helpers.showSnackbar(context, "Item already exist",backgroundColor:  const Color.fromARGB(255, 231, 85, 209));
                Navigator.pushNamed(context, CartView.id);
              }
            },
            builder: (context, state) {
              return CustomContainer(
                onTap: () {
                  BlocProvider.of<AddToCartCubit>(context).addingToCart(
                      productId: itemdetails.id ?? "",
                      productName: itemdetails.name ?? "",
                      productImg: itemdetails.img ?? "",
                      price: itemdetails.price ?? 0);
                },
                text: "Add To Cart",
              );
            },
          ),
        ],
      ),
    );
  }
}
