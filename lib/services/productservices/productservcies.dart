import 'package:dio/dio.dart';
import 'package:lazashopping/model/ProductModel/product.dart';

class ProductServces{
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

Future<List<Product>> getdata()async{
  dynamic result;
 try {
  Response  result=await dio.get("https://laza.runasp.net/api/Product/GetAllProducts");
  if(result.statusCode==200){
         return (result.data as List).map((item) => Product.fromJson(item)).toList();

}
} on Exception catch (e) {
throw Exception(e.toString());

}
return result;
}


// Future<List<Product>> getdataByCategoryId({required String productCategoryId})async{
//   dynamic result;
//  try {
//   Response  result=await dio.get("https://laza.runasp.net/api/Product/GetProductsByCategoryId/$productCategoryId");
//   if(result.statusCode==200){
//              print(result);

//          return (result.data as List).map((item) => Product.fromJson(item)).toList();

// }

// } on Exception catch (e) {
// throw Exception(e.toString());

// }
// return result;
// }

    Future<List<Product>> getCategory({required String id}) async {
  final dio = Dio();
  final String url = "https://laza.runasp.net/api/Product/GetProductsByCategoryId?categoryId$id";

  try {
    Response response = await dio.get(url);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data != null && response.data.isNotEmpty) {
        List<dynamic> jsonData = response.data;
        print("WWWWWWW");
        print(jsonData);
        List<Product> searchModel = jsonData.map((item) => Product.fromJson(item)).toList();
        return searchModel;
} else {
        throw Exception("Empty response body");
      }
    } else {
      throw Exception("Something went wrong: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load search results: $e");
  }
}




}