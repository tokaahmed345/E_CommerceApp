import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lazashopping/model/WishListModel/getallwishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetUserWishListServices {
  Dio dio = createSetUp();
  static createSetUp() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: false,
      responseHeader: true,
      responseBody: false,
      error: true,
    ));
    return dio;
  }

  Future<List<GetAllUserWishList>> getAllWishList() async {
    try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token not found");
      }

      final response = await dio.get(
          "https://laza.runasp.net/api/WishList/GetUserWishList",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          }),
        );
               print("🔹 Response Data: ${response.data}");


      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null && response.data.isNotEmpty) {
          List<dynamic> responseData = response.data;
          return responseData
              .map((element) => GetAllUserWishList.fromJson(element))
              .toList();
        } else {
          throw Exception("Empty response body");
        }
      } else {
        throw Exception("Something went wrong: ${response.statusCode}");
      }
    } on Exception catch (e) {
      throw Exception("Failed to add   wishlist: $e");
    }
  }
}
