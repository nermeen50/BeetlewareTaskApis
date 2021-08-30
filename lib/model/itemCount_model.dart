class ItemModel {
  ItemModel({
    this.data,
    this.status,
  });

  var data;
  String status;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        data: json["data"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
      };
}
