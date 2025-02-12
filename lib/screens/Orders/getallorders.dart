import 'package:flutter/material.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/get_all_item_in_cart_cubit.dart';
import 'package:lazashopping/model/CartModel/getallitemincart.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/orders/get_Orders_Services.dart';

class GetOrders extends StatelessWidget {
  const GetOrders({super.key});
static String id="order";
  @override
  Widget build(BuildContext context) {

    Future<List<dynamic>>fetchOrders()async{
 return await GetAllOrdersServices().getOrders();

    }
    return Scaffold(
appBar: const CustomAppBar(title: "Orders"),
         backgroundColor: Color(0xffEDE9FE),
body: Column(
children: [

  Expanded(
    child: FutureBuilder<List<dynamic>>(future:fetchOrders() , builder: (context,snapshot){
    if(snapshot .connectionState==ConnectionState.waiting){
    return Center(child: CircularProgressIndicator());
    
    
    }else if(!snapshot.hasData||snapshot.data!.isEmpty){
    return Text(snapshot.data.toString());
    
    }else if(snapshot.hasData||snapshot.data!.isNotEmpty){
    
            List<dynamic> orders = snapshot.data!;
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context,index){
      final order=orders[index];
        final String productName = order["ProductName"] ?? "Unknown";
                final String productImage = order["ProductImg"] ?? "";
                final double price = (order["Price"] ?? 0).toDouble();
                final int quantity = order["Quantity"] ?? 1;
     return Card(
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
                                     SizedBox(height: 10),

                      Text("\$$price",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                             
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(  "Quantity is : ${quantity.toString()}" ,
                                    style: TextStyle(fontSize: 16)),
                              ),
                           Spacer(),
                              IconButton(
                                icon: Icon(Icons.delete_outline,
                                    color: Colors.grey),
                                onPressed: ()async {
                             
                                },
                              ),
                            ],
                          )
              ])
                )
    ])
    
                  )
                  );
    });
    
    
                   
    
    
    }
    else{
    return Text(snapshot.error.toString());
    }
    
    }),
  )
],

),


    );
  }
}