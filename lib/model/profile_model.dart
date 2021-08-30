class ProfileModel {
  ProfileModel({
    this.data,
  });

  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.avatar,
  });

  int id;
  String name;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
      };
}
