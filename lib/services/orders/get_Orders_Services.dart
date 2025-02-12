import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetAllOrdersServices
{

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


// Future <Map<String, dynamic>> getOrders()async{

//  try{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString("token");

//       if (token == null) {
//         throw Exception("Token not found");
//       }



//  var response= await dio.get("https://laza.runasp.net/api/Order/GetOrder",
 
//  options: Options(

// headers: {
//     "Authorization": "Bearer $token",
//             "Content-Type": "application/json"
// }

//  ));
//                 print("🔹 Response Data: ${response.data}");

//   if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         if (response.data != null && response.data.isNotEmpty) {
//        return response.data;
          
              
//         } else {
//           throw Exception("Empty response body");
//         }
//       } else {
//         throw Exception("Something went wrong: ${response.statusCode}");
//       }
//     } on Exception catch (e) {
//       throw Exception("Failed to add   Cart: $e");
//     }
  








// }

// }
Future<List<dynamic>> getOrders() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token == null) {
      throw Exception("Token not found");
    }

    var response = await dio.get(
      "https://laza.runasp.net/api/Order/GetOrder",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        }
      )
    );

    print("🔹 Response Data: ${response.data}");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data != null && response.data.isNotEmpty) {
        // استخراج قائمة "Items" مباشرة
        return response.data[0]["Items"] ?? [];
      } else {
        throw Exception("Empty response body");
      }
    } else {
      throw Exception("Something went wrong: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to fetch orders: $e");
  }
}
}