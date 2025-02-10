class AddToCart {
    String? productId;
    String? productName;
    String? productImg;
    double? price;
    int? quantity;

    AddToCart({this.productId, this.productName, this.productImg, this.price, this.quantity});

    AddToCart.fromJson(Map<String, dynamic> json) {
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