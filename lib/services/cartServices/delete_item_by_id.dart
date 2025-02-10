import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteItemByIdServices {
  Dio dio = createSetUp();
  static createSetUp() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true));

    return dio;
  }

  Future deleteItemById({required String id}) async {
    try {
     SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token not found");
      }

      final data = await dio.delete(
          "https://laza.runasp.net/api/Cart/Remove-items/$id",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          }));

      print("🔹 Response Data: ${data.data}");

      if (data.statusCode! >= 200 && data.statusCode! < 300) {
        if (data.data != null && data.data.isNotEmpty) {
          return data.data;
        } else {
          throw Exception("Empty response body");
        }
      } else {
        throw Exception("Something went wrong: ${data.statusCode}");
      }
    } on Exception catch (e) {
      throw Exception("Failed to delete item   : $e");
    }
  }
}
