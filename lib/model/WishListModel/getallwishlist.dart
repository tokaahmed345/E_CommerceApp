

import 'package:lazashopping/model/ProductModel/product.dart';

class GetAllUserWishList {
    String? id;
    String? name;
    double? price;
    String? img;
    String? description;

    GetAllUserWishList({this.id, this.name, this.price, this.img, this.description});

    GetAllUserWishList.fromJson(Map<String, dynamic> json) {
        id = json["Id"];
        name = json["Name"];
        price = json["Price"];
        img = json["Img"];
        description = json["Description"]; 
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Id"] = id;
        _data["Name"] = name;
        _data["Price"] = price;
        _data["Img"] = img;
        _data["Description"] = description; 
        return _data;
    }

    Product toProduct() {
        return Product(
          id: id ?? "0",
          name: name ?? "No Name",
          price: price ?? 0.0,
          img: img ?? "",
          description: description ?? ""
        );
    }
}
