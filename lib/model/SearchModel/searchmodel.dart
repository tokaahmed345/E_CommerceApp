
class SearchModel {
    String? id;
    String? name;
    String? description;
    String? img;
    double? price;
    String? categoryId;
    List<dynamic>? images;
    List<dynamic>? reviews;

    SearchModel({this.id, this.name, this.description, this.img, this.price, this.categoryId, this.images, this.reviews});

    SearchModel.fromJson(Map<String, dynamic> json) {
        id = json["Id"];
        name = json["Name"];
        description = json["Description"];
        img = json["Img"];
        price = json["Price"];
        categoryId = json["CategoryId"];
        images = json["Images"] ?? [];
        reviews = json["Reviews"] ?? [];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Id"] = id;
        _data["Name"] = name;
        _data["Description"] = description;
        _data["Img"] = img;
        _data["Price"] = price;
        _data["CategoryId"] = categoryId;
        if(images != null) {
            _data["Images"] = images;
        }
        if(reviews != null) {
            _data["Reviews"] = reviews;
        }
        return _data;
    }
}
