import 'package:dio/dio.dart';
import 'package:lazashopping/model/AuthModel/verfication.dart';

class VerficationServices {


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
 
 Future <Verfication>Verfy({required String email, required String code})async{
      try {
  final response= await dio.post("https://laza.runasp.net/api/Auth/verify-code",data: {
  "Email": email,
  "code":code,
  
        


  });

if(response.statusCode==200){

  return Verfication.fromJson(response.data);
}else{
  throw Exception("error ${response.data}");
}

} on Exception catch (e) {
  throw Exception(e);
}


 }





}