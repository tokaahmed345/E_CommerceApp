 
class Product {
    String? id;
    String? name;
    double? price;
    String? description;
    String? categoryId;
    String? img;
    List<Images>? images;
    List<dynamic>? reviews;

    Product({this.id, this.name, this.price, this.description, this.categoryId, this.img, this.images, this.reviews});

    Product.fromJson(Map<String, dynamic> json) {
        id = json["Id"];
        name = json["Name"];
        price = json["Price"];
        description = json["Description"];
        categoryId = json["CategoryId"];
        img = json["Img"];
        images = json["Images"] == null ? null : (json["Images"] as List).map((e) => Images.fromJson(e)).toList();
        reviews = json["Reviews"] ?? [];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Id"] = id;
        _data["Name"] = name;
        _data["Price"] = price;
        _data["Description"] = description;
        _data["CategoryId"] = categoryId;
        _data["Img"] = img;
        if(images != null) {
            _data["Images"] = images?.map((e) => e.toJson()).toList();
        }
        if(reviews != null) {
            _data["Reviews"] = reviews;
        }
        return _data;
    }
}

class Images {
    String? image;

    Images({this.image});

    Images.fromJson(Map<String, dynamic> json) {
        image = json["Image"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Image"] = image;
        return _data;
    }
}
 