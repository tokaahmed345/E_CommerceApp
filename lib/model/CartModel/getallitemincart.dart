class GetAllItemInCart {
    String? id;
    String? userId;
    double? totalPrice;
    List<Items>? items;

    GetAllItemInCart({this.id, this.userId, this.totalPrice, this.items});

    GetAllItemInCart.fromJson(Map<String, dynamic> json) {
        id = json["Id"];
        userId = json["UserId"];
        totalPrice = json["TotalPrice"];
        items = json["Items"] == null ? null : (json["Items"] as List).map((e) => Items.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Id"] = id;
        _data["UserId"] = userId;
        _data["TotalPrice"] = totalPrice;
        if(items != null) {
            _data["Items"] = items?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Items {
    String? productId;
    String? productName;
    String? productImg;
    double? price;
    int? quantity;

    Items({this.productId, this.productName, this.productImg, this.price, this.quantity});

    Items.fromJson(Map<String, dynamic> json) {
        productId = json["ProductId"];
        productName = json["ProductName"];
        productImg = json["ProductImg"];
        price = json["Price"];
        quantity = json["Quantity"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["ProductId"] = productId;
        _data["ProductName"] = productName;
        _data["ProductImg"] = productImg;
        _data["Price"] = price;
        _data["Quantity"] = quantity;
        return _data;
    }
}