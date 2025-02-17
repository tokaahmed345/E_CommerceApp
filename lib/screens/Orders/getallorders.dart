import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/orders/get_Orders_Services.dart';
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
            
            // Expanded(
            //   child: FutureBuilder<List<dynamic>>(
            //       future: fetchOrders(),
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return Center(child: CircularProgressIndicator());
            //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //           return Text(snapshot.data.toString());
            //         } else if (snapshot.hasData || snapshot.data!.isNotEmpty) {
            //           List<dynamic> orders = snapshot.data!;
            //           return ListView.builder(
            //               itemCount: orders.length,
            //               itemBuilder: (context, index) {
            //                 final order = orders[index];
        
            //                 return Card(
            //                     color: Theme.of(context).cardColor,
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(15)),
            //                     elevation: 5,
            //                     child: Padding(
            //                         padding: EdgeInsets.all(12),
            //                         child: Row(children: [
            //                           Image.network(
            //                             "https://laza.runasp.net/${order["ProductImg"] ?? ""}", // تأكد من مسار الصورة الصحيح
            //                             width: 80,
            //                             height: 80,
            //                           ),
            //                           SizedBox(width: 10),
            //                           Expanded(
            //                               child: Column(
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.start,
            //                                   children: [
            //                                 Text(
            //                                     order["ProductName"] ?? "Unknown",
            //                                     style: TextStyle(
            //                                         fontWeight: FontWeight.bold)),
            //                                 SizedBox(height: 10),
            //                                 Text(
            //                                     "\$${(order["Price"] ?? 0).toDouble()}",
            //                                     style: TextStyle(
            //                                         fontWeight: FontWeight.bold)),
            //                                 Row(
            //                                   children: [
            //                                     Padding(
            //                                       padding: EdgeInsets.symmetric(
            //                                           horizontal: 10),
            //                                       child: Text(
            //                                           "Quantity is : ${order["Quantity"] ?? 1.toString()}",
            //                                           style: TextStyle(
            //                                               fontSize: 16)),
            //                                     ),
            //                                     Spacer(),
            //                                     IconButton(
            //                                       icon: Icon(Icons.delete_outline,
            //                                           color: Colors.grey),
            //                                       onPressed: () async {},
            //                                     ),
            //                                   ],
            //                                 )
            //                               ]))
            //                         ])));
            //               });
            //         } else {
            //           return Text(snapshot.error.toString());
            //         }
            //       }),
            // )
            Lottie.asset("assets/images/Animation - 1739745126049.json"),
            SizedBox(height: 40,)
,            Text("No orders Available ,Order Now ",style: TextStyle(fontSize: 22,  color: const Color.fromARGB(
                                        255, 133, 39, 176)),)
          ],
        ),
      ),
    );
  }
}
