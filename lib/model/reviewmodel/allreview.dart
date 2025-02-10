
class AllReview {
    String? username;
    String? feedback;
    int? rating;

    AllReview({this.username, this.feedback, this.rating});

    AllReview.fromJson(Map<String, dynamic> json) {
        username = json["Username"];
        feedback = json["Feedback"];
        rating = json["Rating"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Username"] = username;
        _data["Feedback"] = feedback;
        _data["Rating"] = rating;
        return _data;
    }
}
