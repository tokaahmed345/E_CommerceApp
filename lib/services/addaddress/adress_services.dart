import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddressServices{


static final Dio dio = _createSetUp();

  static Dio _createSetUp() {
    Dio dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
    return dio;
  }

Future addAdress({required String name,required String country,required String city ,required String phone,required String address})async{

 try {
  SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      if (token == null) {
        throw Exception("Token not found");
      }

  final response= await dio.post("https://laza.runasp.net/api/Card/Add-Address",data: {
  "UserName": name,
  "Address": address,
  "City": city,
  "Country": country,
  "Phone":phone
  }, options: Options(
        headers: {
          "Authorization": "Bearer $token", // Add token here
          "Content-Type": "application/json" // Ensure correct content type
        },
      ),);
  print("response ${response.data}");
  if(response.statusCode==200){
   return response.data;
  }else{
   return "";
  }
  
} on Exception catch (e) {
  throw Exception(e.toString());
}

}




}