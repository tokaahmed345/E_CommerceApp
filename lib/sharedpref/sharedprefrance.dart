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
 static Future<void> saveUsername(String username) async {
  await prefs.setString('username', username);
}
static Future<String>getUserName()async{
    String? username = prefs.getString("username");
  print("Retrieved Username: $username"); // للتحقق من القيمة المخزنة
  return username ?? "Guest";
}
static Future<void>savePassword(String userPassword)async{
 await prefs.setString("password",userPassword);
}
static Future<String>getPassword()async{
 String ?password=  prefs.getString("password");
 return password??"no password available";
}
static Future <void>setEmail(String email)async{
  await prefs.setString("email", email);
}
static Future <Map<String ,String>>getInfo()async{
  String ?password=prefs.getString("password")??"No Password Available";
  String ?email=prefs.getString("email")??"No Email Found";
  String ?username=prefs.getString("username")??"No userName Found";
  return{
    "password":password,
    "email":email,
    "username":username,
  };


}
static Future<void> logout() async {
  await prefs.remove('token');
  await prefs.remove('username');
  await prefs.remove('password');
  await prefs.remove('email');
}

}