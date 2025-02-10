class WishListResponse {
  String? message;

  WishListResponse({this.message});

  WishListResponse.fromJson(Map<String, dynamic> json) {
    message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Message"] = message;
    return _data;
  }
}