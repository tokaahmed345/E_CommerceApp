import 'package:shared_preferences/shared_preferences.dart';
class SharedPref {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
  static void saveToken(String token) {
    prefs.setString("token", token);
  }
  static String? getToken() {
    String? token = prefs.getString("token");
    print("Retrieved Token: $token"); // طباعة التوكن المسترجع
    return token;
  }
  static Future<void> removeToken() async {
    await prefs.remove('token');
  }
}