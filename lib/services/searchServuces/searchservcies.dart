import 'package:dio/dio.dart';
import 'package:lazashopping/model/SearchModel/searchmodel.dart';

class SearchServces{
Dio dio =createSetUp();

static Dio createSetUp(){
  Dio dio =Dio ();
dio.interceptors.add(LogInterceptor(
 request : true,
   requestHeader : true,
   requestBody : false,
   responseHeader : true,
   responseBody : false,
   error :true,
));
return dio ;

}

Future <List <SearchModel>>getProductTerm(String termName)async{
try {
    Response response=  await dio.get("https://laza.runasp.net/api/Product/Search?SearchTerm=$termName");
  
  if(response.statusCode==200){
    return (response.data as List).map((item)=>SearchModel.fromJson(item)).toList();
  }else{
    throw Exception("Error:${response.data}");
  }
} on Exception catch (e) {
    throw Exception(e.toString());


}
}



}