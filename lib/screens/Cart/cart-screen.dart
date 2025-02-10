import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/get_all_item_in_cart_cubit.dart';
import 'package:lazashopping/screens/Cart/addressscreen.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/screens/Cart/customwidget/customaddresssection.dart';
import 'package:lazashopping/screens/Cart/customwidget/customcardcart.dart';
import 'package:lazashopping/screens/Cart/customwidget/custompaymentlisttile.dart';
import 'package:lazashopping/screens/Cart/customwidget/customtitlecard.dart';
import 'package:lazashopping/screens/Cart/customwidget/summaryorder.dart';
import 'package:lazashopping/screens/orderconfirmed/orderconfirmed.dart';
import 'package:lazashopping/screens/paymentscreen/payment.dart';
import 'package:lazashopping/services/cartServices/getallservices.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lottie/lottie.dart';
class CartView extends StatelessWidget {
  const CartView({super.key});
  static String id = 'cart';

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> ?controllers =   ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>?;
    return BlocProvider(
      create: (context) =>
          GetAllItemInCartCubit(getAllItemsServices: GetAllItemInCartServices())
            ..getAllItemsInCart(),
      child: BlocConsumer<GetAllItemInCartCubit, GetAllItemInCartState>(
        listener: (context, state) {
          if (state is GetAllItemInCartFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEDE9FE),
            appBar: const CustomAppBar(title: "Cart"),
            body: Column(
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state is GetAllItemInCarLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetAllItemInCartFailure) {
                        return Center(
                          child: Text("Error: ${state.message}",
                              style: const TextStyle(color: Colors.red)),
                        );
                      } else if (state is GetAllItemInCartSuccess) {
                        List<dynamic> items = state.getAllItems["Items"] ?? [];
                        if (items.isEmpty) {
                          return Center(
                              child: Column(children: [
                            Lottie.asset(
                                "assets/images/Animation - 1739207738917.json"),
                            Text(
                              "Cart Is Empty ",
                              style: TextStyle(
                                  fontSize: 30,
                                  color:
                                      const Color.fromARGB(255, 133, 39, 176)),
                            )
                          ]));
                        }
                        return ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            ...items.map((item) => CustomCardCart(
                                  productid: item["ProductId"],
                                  price: item["Price"],
                                  productImage: item["ProductImg"],
                                  productName: item["ProductName"],
                                  quantity: item["Quantity"],
                                )),
                            const SizedBox(height: 16),
                            const CustomTitleCard(title: 'Delivery Address'),
                            CustomAddressSection(
                              onTap: () {
                                Navigator.pushNamed(context, AddressScreen.id);
                              },
                              title: controllers?["address"]??"click to add address",
                              subTitle:controllers ?["country"]??"",
                            ),
                            const SizedBox(height: 16),
                            const CustomTitleCard(title: "Payment Methods"),
                            CustomListtileCard(
                              onTap: () {
                                Navigator.pushNamed(context, PaymentScreen.id);
                              },
                              title: "Visa Classic",
                              subTitle: "**** 7690",
                              image: "assets/images/Frame.png",
                            ),
                            const SizedBox(height: 16),
                            const CustomTitleCard(title: 'Order Info'),
                             SummaryOrderInfo(items: items,),
                            const SizedBox(height: 16),
                          ],
                        );
                      } else {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                    },
                  ),
                ),
                CustomContainer(
                  text: "Checkout",
                  onTap: () {
                    Navigator.pushNamed(context, OrderConfirmedScreen.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
