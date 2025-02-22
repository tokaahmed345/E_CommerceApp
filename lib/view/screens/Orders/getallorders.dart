import 'package:flutter/material.dart';
import 'package:lazashopping/services/orders/get_Orders_Services.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAppbar.dart';
import 'package:lottie/lottie.dart';
class GetOrders extends StatelessWidget {
  const GetOrders({super.key});
  static String id = "order";
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchOrders() async {
      return await GetAllOrdersServices().getOrders();
    }
    return Scaffold(
      appBar: const CustomAppBar(title: "Orders"),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          children: [
            
         
            Lottie.asset("assets/images/Animation - 1739745126049.json"),
            const SizedBox(height: 40,)
,            const Text("No orders Available ,Order Now ",style: TextStyle(fontSize: 22,  color: Color.fromARGB(
                                        255, 133, 39, 176)),)
          ],
        ),
      ),
    );
  }
}
