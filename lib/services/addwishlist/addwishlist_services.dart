import 'package:dio/dio.dart';
import 'package:lazashopping/model/WishListModel/wishlist_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddWishlListServices {
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

  Future<List<WishListResponse>> addWishList(
      {required String productId,
      required String name,
      required String img,
      required double price}) async {
    try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token not found");
      }

      final response = await dio.post(
          "https://laza.runasp.net/api/WishList/Add-WishList",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          }),
          data: {
            "Id": productId,
            "Name": name,
            "Price": price,
            "Img": img,
          });
               print("🔹 Response Data: ${response.data}");


      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null && response.data.isNotEmpty) {
          List<dynamic> responseData = response.data;
          return responseData
              .map((element) => WishListResponse.fromJson(element))
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
