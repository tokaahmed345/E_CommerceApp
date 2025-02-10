import 'package:dio/dio.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/model/ProductModel/product.dart';


class ItemInfoServces {

Dio dio =createSetUp();
static Dio createSetUp(){

Dio dio =Dio();
dio.interceptors.add(LogInterceptor(
request: true,
   requestHeader : true,
   requestBody : true,
   responseHeader : true,
   responseBody : true,
   error : true,
));
  

return dio;



}
Future<ItemInfo?>getProductInfo(Product  Productid)async{
try {
    Response data=  await dio.get("https://laza.runasp.net/api/Product/GetProductBy/${Productid.id}");
  if(data.statusCode==200){
   return ItemInfo.fromJson(data.data);
    
  }else{
    throw Exception("Error: ${data.data}");
  }
} on Exception catch (e) {
throw Exception(e.toString());
}

}






}