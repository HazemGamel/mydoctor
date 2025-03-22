class DoctorDetailsModel {
  final bool allowCalls;
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String phone;
  final String descriptionEn;
  final String descriptionAr;
  final String specialization;
  final DateTime createdAt;
  final DateTime updatedAt;

  DoctorDetailsModel({
    required this.allowCalls,
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.phone,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.specialization,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsModel(
      allowCalls: json["allowCalls"] ?? false,
      id: json["_id"] ?? "",
      nameEn: json["name_en"] ?? "",
      nameAr: json["name_ar"] ?? "",
      image: json["image"] ?? "",
      phone: json["phone"] ?? "",
      descriptionEn: json["description_en"] ?? "",
      descriptionAr: json["description_ar"] ?? "",
      specialization: json["specialization"] ?? "",
      createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "allowCalls": allowCalls,
      "_id": id,
      "name_en": nameEn,
      "name_ar": nameAr,
      "image": image,
      "phone": phone,
      "description_en": descriptionEn,
      "description_ar": descriptionAr,
      "specialization": specialization,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}