
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lazashopping/model/AuthModel/login.dart';

class LoginServices 
{
final Dio dio=createSetUp();
static createSetUp(){
Dio dio =Dio();

dio.interceptors.add(LogInterceptor(
request :true,
   requestHeader : true,
   requestBody : false,
   responseHeader : true,
   responseBody : false,
   error : true,
));

return dio;
}
Future <LogIn>fetchInfo({required String email,required String password,required bool rememberMe })async{
try {
  final  response = await dio.post("https://laza.runasp.net/api/Auth/Login",data: {
        "Email" :email,
        "Password":password,
        "RememberMe":rememberMe
  }); 
  if(response.statusCode== 200 && response.data["Token"]!=null){

  //   String token=response.data["Token"];
  // var box=await Hive.openBox('userBox');
  //  await box.put("token", token);
        //  print("User Token Saved: $token");


    return LogIn.fromJson(response.data);
  }else{
   throw Exception("error ${response.data}");
  }
} on Exception catch (e) {
  throw Exception(e.toString());

}



}





}