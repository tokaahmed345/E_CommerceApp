import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lazashopping/model/reviewmodel/add_review_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddReviewService{

Dio dio =createSetUp();
static  createSetUp(){
Dio dio=Dio();
dio.interceptors.add(LogInterceptor(
request :true,
   requestHeader :true,
   requestBody : true,
   responseHeader :true,
   responseBody : true,
   error :true,


));
return dio;

}


//  Future<List<AddReview>> addReview({required String id}) async {
// final String url = "https://laza.runasp.net/api/Review/AddReview/$id";

//   try {
//     var box=await Hive.openBox('userBox'); 
//  String ?token=await   box.get("token");
//       print("Token: $token");

//       if (token == null) {
//         throw Exception("Token is not available");
//       }
//     Response response = await dio.post(url,options: Options(
//       headers: {
//              "Authorization": "Bearer $token",
//              "Content-Type":"application/json", 
//       }
//     ));

//     if (response.statusCode! >= 200 && response.statusCode! < 300) {
//       if (response.data != null && response.data.isNotEmpty) {
//         List<dynamic> jsonData = response.data;
//         print("WWWWWWW");
//         print(jsonData);
//         List<AddReview> review = jsonData.map((item) => AddReview.fromJson(item)).toList();
//         return review;
// } else {
//         throw Exception("Empty response body");
//       }
//     } else {
//       throw Exception("Something went wrong: ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Failed to load search results: $e");
//   }
// }

Future<AddReview> addReview({required String id, required String userName, required String feedback, required double rating}) async {
  final String url = "https://laza.runasp.net/api/Review/AddReview/$id";

  try {
   SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token not found");
      }

    AddReview review = AddReview(
      userName: userName,
      feedback: feedback,
      rating: rating,
      productId: id,
    );

    Map<String, dynamic> data = review.toJson();

    Response response = await dio.post(
      url,
      data: data, // إرسال البيانات في الجسم
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json", // تأكد من أن نوع المحتوى هو JSON
        },
      ),
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data != null && response.data.isNotEmpty) {
        // List<dynamic> jsonData = response.data;
        // List<AddReview> reviewResult = jsonData.map((item) => AddReview.fromJson(item)).toList();
      return AddReview.fromJson(response.data);
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