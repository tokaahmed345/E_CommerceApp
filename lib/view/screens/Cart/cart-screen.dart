import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/calculate_total_cubit.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/get_all_item_in_cart_cubit.dart';
import 'package:lazashopping/helpers/helper.dart';
import 'package:lazashopping/view/screens/Cart/addressscreen.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customaddresssection.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customcardcart.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/custompaymentlisttile.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customtitlecard.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/summaryorder.dart';
import 'package:lazashopping/view/screens/paymentscreen/pay_details.dart';
import 'package:lazashopping/services/cartServices/getallservices.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lottie/lottie.dart';
class CartView extends StatelessWidget {
  const CartView({super.key});
  static String id = 'cart';
  @override
  Widget build(BuildContext context) {
    // Get screen width and height from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllItemInCartCubit(
            getAllItemsServices: GetAllItemInCartServices(),
          )..getAllItemsInCart(),
        ),
        BlocProvider(create: (context) => CalculateTotalCubit()),
      ],
      child: BlocConsumer<GetAllItemInCartCubit, GetAllItemInCartState>(
        listener: (context, state) {
          if (state is GetAllItemInCartFailure) {
            Helpers.showSnackbar(context, state.message,
                backgroundColor: const Color.fromARGB(255, 231, 85, 209));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: const CustomAppBar(title: "Cart"),
            body: FutureBuilder<Map<String, String>>(
              future: SharedPref
                  .getAddress(), // Fetch saved address from SharedPreferences
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  var savedData = snapshot.data!;
                  return Column(
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (state is GetAllItemInCarLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is GetAllItemInCartFailure) {
                              return Center(
                                child: Text(
                                  "Error: ${state.message}",
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            } else if (state is GetAllItemInCartSuccess) {
                               BlocProvider.of<CalculateTotalCubit>(context)
      .updateTotal(state.getAllItems["Items"]);
                              List<dynamic> items =
                                  state.getAllItems["Items"] ?? [];

                              if (items.isEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.1),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.5,
                                          child: Lottie.asset(
                                              "assets/images/Animation - 1739721795829.json"),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Cart Is Empty",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.06,
                                            color: const Color.fromARGB(
                                                255, 133, 39, 176),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              return ListView(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02),
                                children: [
                                  ...items.map((item) => CustomCardCart(
                                        productid: item["ProductId"],
                                        price: item["Price"],
                                        productImage: item["ProductImg"],
                                        productName: item["ProductName"],
                                        quantity: item["Quantity"],
                                      )),
                                  SizedBox(height: screenHeight * 0.02),
                                  const CustomTitleCard(
                                      title: 'Delivery Address'),
                                  CustomAddressSection(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AddressScreen.id);
                                    },
                                    title: savedData['address'] ??
                                        "Click to add address",
                                    subTitle: savedData['country'] ?? "",
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  const CustomTitleCard(
                                      title: "Payment Method"),
                                  CustomListtileCard(
                                  
                                    title: "Pay With Visa ",
                                    subTitle: "**** 7690",
                                    image: "assets/images/Frame.png",
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  const CustomTitleCard(title: 'Order Info'),
                                  SummaryOrderInfo(
                                    items: state.getAllItems["Items"] ?? [],
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                ],
                              );
                            } else {
                              return const Center(
                                  child: Text("Something went wrong"));
                            }
                          },
                        ),
                      ),
                      Container(
                        child: CustomContainer(
                          text: "Checkout",
                          onTap: () {
                            final currentState =
                                BlocProvider.of<GetAllItemInCartCubit>(context)
                                    .state;

                            if (currentState is GetAllItemInCartSuccess &&
                                currentState.getAllItems["Items"] != null &&
                                currentState.getAllItems["Items"].isNotEmpty) {
                            
                              final totalState = BlocProvider.of<CalculateTotalCubit>(context).state;
if (totalState is CalculateTotalSuccess) {
  Navigator.pushNamed(
    context,
    DetailsPayment.id,
    arguments: totalState.total, // الآن نحصل على total بشكل صحيح
  );
} else {
  Helpers.showSnackbar(context, "Failed to calculate total",
      backgroundColor: const Color.fromARGB(255, 231, 85, 209));
}
                            } else {
                              Helpers.showSnackbar(context, "No Item Found",
                                  backgroundColor:
                                      const Color.fromARGB(255, 231, 85, 209));
                            }
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text("Error: No address found"));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
