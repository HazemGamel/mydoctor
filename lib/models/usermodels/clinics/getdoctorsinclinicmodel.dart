class DoctorsInClinicModel {
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String phone;
  final String descriptionEn;
  final String descriptionAr;
  final String specialization;
  final bool allowCalls;
  final DateTime createdAt;
  final DateTime updatedAt;

  DoctorsInClinicModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.phone,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.specialization,
    required this.allowCalls,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorsInClinicModel.fromJson(Map<String, dynamic> json) {
    return DoctorsInClinicModel(
      id: json['_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      image: json['image'],
      phone: json['phone'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      specialization: json['specialization'],
      allowCalls: json['allowCalls'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'phone': phone,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'specialization': specialization,
      'allowCalls': allowCalls,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
