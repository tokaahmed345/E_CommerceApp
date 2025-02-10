class UpdatePassword {
    String? message;

    UpdatePassword({this.message});

    UpdatePassword.fromJson(Map<String, dynamic> json) {
        message = json["Message"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Message"] = message;
        return _data;
    }
}
