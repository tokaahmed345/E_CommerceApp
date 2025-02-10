import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllReviewServces{
  Dio dio =createSetUp();


static createSetUp(){
  Dio dio =Dio();
  dio.interceptors.add(LogInterceptor( request : true,
   requestHeader : true,
   requestBody : true,
   responseHeader : true,
   responseBody : true,
   error :true,));


   return dio;
}

Future<List<Review>>getAllReview({required String id})async{

  try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token not found");
      }


Response response=  await dio.get("https://laza.runasp.net/api/Review/All-reviews/$id",
  options: Options(headers: {"Authorization": "Bearer $token",
          "Content-Type": "application/json"}));
  if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data != null && response.data.isNotEmpty) {
        List<dynamic> responseData = response.data;
      return responseData.map((review) => Review.fromJson(review)).toList();
      } else {
        throw Exception("Empty response body");
      }
    } else {
      throw Exception("Something went wrong: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load search results: $e");
  }
}
}