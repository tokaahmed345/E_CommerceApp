
class AddReview {
    String? id;
    String? userId;
    String? userName;
    String? feedback;
    double? rating;
    String? productId;
    dynamic product;

    AddReview({this.id, this.userId, this.userName, this.feedback, this.rating, this.productId, this.product});

    AddReview.fromJson(Map<String, dynamic> json) {
        id = json["Id"];
        userId = json["UserId"];
        userName = json["UserName"];
        feedback = json["Feedback"];
        rating = json["Rating"];
        productId = json["productId"];
        product = json["Product"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Id"] = id;
        _data["UserId"] = userId;
        _data["UserName"] = userName;
        _data["Feedback"] = feedback;
        _data["Rating"] = rating;
        _data["productId"] = productId;
        _data["Product"] = product;
        return _data;
    }
}
