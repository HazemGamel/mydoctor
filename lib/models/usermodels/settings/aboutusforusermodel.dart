
class AboutUsForUserModel {
  String id;
  String name;
  String value;
  String createdAt;
  String updatedAt;
  String image;

  AboutUsForUserModel({
    required this.id,
    required this.name,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  // Factory method to create an object from JSON
  factory AboutUsForUserModel.fromJson(Map<String, dynamic> json) {
    return AboutUsForUserModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      value: json["value"] ?? "",
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      image: json["image"] ?? "",
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "value": value,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "image": image,
    };
  }
}
