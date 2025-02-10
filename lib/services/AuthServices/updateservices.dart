import 'package:dio/dio.dart';
import 'package:lazashopping/model/AuthModel/updatepassword.dart';

class updatePasswordServices {

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





Future <UpdatePassword> reset({required String email,required String password,required String confirmEmail})async{
try {
  final response=   await dio.post("https://laza.runasp.net/api/Auth/update-password",data: {
    "Email":email,
  "NewPassword":password,
  "ConfirmPassword":confirmEmail
  });

if(response.statusCode==200){
return UpdatePassword.fromJson(response.data);
}else{
  throw Exception("Error:${response.data["Message"]??"unKnown error"}");
}


} on Exception catch (e) {
  throw Exception(e.toString());
}



}



}