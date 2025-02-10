import 'package:dio/dio.dart';
import 'package:lazashopping/model/AuthModel/forgot.dart';

class ForgotServices {

Dio dio =createSsetUp();
static Dio createSsetUp(){
  Dio dio=Dio();

dio.interceptors.add(LogInterceptor(
request : true,
   requestHeader : true,
   requestBody : false,
   responseHeader : true,
   responseBody :false,
   error:true



));
return dio;
}





Future <ForgotPassword>reset({required String email})async{
try {
  final response=   await dio.post("https://laza.runasp.net/api/Auth/reset-password",data: {
    "Email":email
  });

if(response.statusCode==200){
return ForgotPassword.fromJson(response.data);
}else{
  throw Exception("Error:${response.data}");
}


} on Exception catch (e) {
  throw Exception(e.toString());
}



}



}