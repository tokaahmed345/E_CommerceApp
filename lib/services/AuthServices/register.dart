import 'package:dio/dio.dart';
import 'package:lazashopping/model/AuthModel/register.dart';

class RegisterServices {


final Dio dio=createsetup();
static  Dio createsetup(){
 Dio dio=Dio();
 dio.interceptors.add(LogInterceptor(
request : true,
   requestHeader :true,
   requestBody : true,
  responseHeader : true,
   responseBody :true,
   error : true,
 )) ;
 return dio;
}
 
 Future <Register>register({required String name,required String email, required String password,required bool rememberMe})async{
      try {
  final response= await dio.post("https://laza.runasp.net/api/Auth/Register",data: {
"Name" : name,
  "Email": email,
  "Password": password,
    "RememberMe" : rememberMe,
        


  });

if(response.statusCode==200){

  return Register.fromJson(response.data);
}else{
  throw Exception("error ${response.data}");
}

} on Exception catch (e) {
  throw Exception(e);
}


 }





}