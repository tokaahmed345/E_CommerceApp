import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/add_to_cart_cubit.dart';
import 'package:lazashopping/helpers/helper.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/services/cartServices/add_to_cart.dart';
import 'package:lazashopping/services/cartServices/getallservices.dart';
import 'package:lazashopping/view/screens/Cart/cart-screen.dart';
import 'package:lazashopping/view/screens/DetailsProduct.dart/customwedgit/custom_info_bode.dart';

import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customstackitem.dart';

class CustomColumninfoCard extends StatelessWidget {
  const CustomColumninfoCard({
    super.key,
    required this.itemdetails,
  });

  final ItemInfo itemdetails;

  @override
  Widget build(BuildContext context) {
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
                const Center(child: CircularProgressIndicator());
              } else if (state is AddToCartFailure) {
                Helpers.showSnackbar(context, state.message,
                    backgroundColor: const Color.fromARGB(255, 231, 85, 209));

                Navigator.pushNamed(context, CartView.id);
              } else {
                Helpers.showSnackbar(context, "Item added Successfully ",
                    backgroundColor: const Color.fromARGB(255, 231, 85, 209));
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
