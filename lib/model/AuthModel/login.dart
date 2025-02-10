
class LogIn {
    String? token;
    String? expire;

    LogIn({this.token, this.expire});

    LogIn.fromJson(Map<String, dynamic> json) {
        token = json["Token"];
        expire = json["Expire"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Token"] = token;
        _data["Expire"] = expire;
        return _data;
    }
}
