import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCartServices{

Dio dio =createSetUp();


static createSetUp(){
Dio dio =Dio();
dio.interceptors.add(LogInterceptor( 
  
  request : true,
   requestHeader : true,
   requestBody : true,
   responseHeader : true,
   responseBody : true,
   error:true
   
   ));
   return dio ;

}


Future <Map<String, dynamic>> addToCart({required String ProductId,required String ProductName,required String ProductImg,required double Price,required int quantity})async{

 try{
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token not found");
      }

 var response= await dio.post("https://laza.runasp.net/api/Cart/AddToCart",
 
 data: {
  "ProductId":ProductId,
   "ProductName": ProductName,
    "ProductImg": ProductImg,
    "Price": Price,
    "Quantity":quantity,
 },
 options: Options(

headers: {
    "Authorization": "Bearer $token",
            "Content-Type": "application/json"
}

 ));
                print("🔹 Response Data: ${response.data}");

  if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null && response.data.isNotEmpty) {
       return response.data;
          
              
        } else {
          throw Exception("Empty response body");
        }
      } else {
        throw Exception("Something went wrong: ${response.statusCode}");
      }
    } on Exception catch (e) {
      throw Exception("Failed to add   Cart: $e");
    }
  








}

}