

class Verfication {
    String? message;

    Verfication({this.message});

    Verfication.fromJson(Map<String, dynamic> json) {
        message = json["message"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["message"] = message;
        return _data;
    }
}