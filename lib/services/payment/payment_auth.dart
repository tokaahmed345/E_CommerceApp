import 'package:dio/dio.dart';
import 'package:lazashopping/constant/constant.dart';

class PaymentAuthServices {
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

  Future<String?> getPaymentAuthToken() async {
    try {
      final response = await dio.post(
          "https://accept.paymob.com/api/auth/tokens",
          options: Options(headers: {"Content-Type": "application/json"}),
          data: {"api_key": Apikey});

      if (response.statusCode == 201 && response.data != null) {
        authToken = response.data["token"];
        print(" auth token is: $authToken");
        return authToken;
      } else {
        print("⚠️ فشل في جلب الـ Auth Token: ${response.data}");
        return null;
      }
    } catch (e) {
      print("❌ خطأ أثناء جلب الـ Auth Token: $e");
      return null;
    }
  }

  Future<int?> getPaymentOrderId(double amount) async {
    try {
      final response = await dio.post(
          "https://accept.paymob.com/api/ecommerce/orders",
          options: Options(headers: {"Content-Type": "application/json"}),
          data: {
            "auth_token": authToken,
            "delivery_needed": false,
            "amount_cents": (amount * 100).toInt(), // ✅ تأكد أنه int
            "currency": "USD",
            "merchant_order_id": generateUniqueOrderId(),
            "items": []
          });

      if (response.statusCode == 201 && response.data != null) {
        order_id = response.data["id"]; // ✅ استرجاعه كـ int بدون تحويل
        print("✅ Order ID: $order_id");
        return order_id; // ✅ إرجاعه كـ int بدون تحويل
      } else {
        print("⚠️ فشل في جلب Order ID: ${response.data}");
        return null;
      }
    } catch (e) {
      print("❌ خطأ أثناء جلب Order ID: $e");
      return null;
    }
  }

  Future<String?> getPaymentRequestTokenCard(String fName, String lName,
      String email, String phone, double amount) async {
    try {
      final response = await dio.post(
          "https://accept.paymob.com/api/acceptance/payment_keys",
          options: Options(headers: {"Content-Type": "application/json"}),
          data: {
            "auth_token": authToken,
            "amount_cents": (amount * 100).toInt().toString(),
            "expiration": 3600,
            "order_id": order_id,
            "billing_data": {
              "first_name": fName,
              "last_name": lName,
              "phone_number": phone,
              "email": email,
              "street": "N/A",
              "building": "N/A",
              "floor": "N/A",
              "apartment": "N/A",
              "city": "N/A",
              "state": "N/A",
              "country": "EG",
              "postal_code": "N/A"
            },
            "currency": "EGP",
            "integration_id": integration_Id
          });

      if (response.statusCode == 201 && response.data != null) {
        requestTokenCard = response.data["token"];
        print(" request token: $requestTokenCard");
        return requestTokenCard;
      } else {
        print("⚠️ فشل في جلب الـ  request token : ${response.data}");
        return null;
      }
    } catch (e) {
      print("❌ خطأ أثناء جلب الـ request token: $e");
      return null;
    }
  }

  int generateUniqueOrderId() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
