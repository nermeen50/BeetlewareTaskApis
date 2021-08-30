class LoginModel {
  LoginModel({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.authorization,
  });

  String authorization;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorization: json["authorization"],
      );

  Map<String, dynamic> toJson() => {
        "authorization": authorization,
      };
}
