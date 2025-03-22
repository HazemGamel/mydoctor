class Top10NearestClinicModel {
  final Location location;
  final bool allowCalls;
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String addressEn;
  final String addressAr;
  final String availabilityEn;
  final String availabilityAr;
  final String image;
  final String phone;
  final String email;
  final List<Specialization> specializations;
  final List<String> doctors;
  final String deviceToken;
  final List<dynamic> offers;
  final String createdAt;
  final String updatedAt;

  Top10NearestClinicModel({
    required this.location,
    required this.allowCalls,
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.addressEn,
    required this.addressAr,
    required this.availabilityEn,
    required this.availabilityAr,
    required this.image,
    required this.phone,
    required this.email,
    required this.specializations,
    required this.doctors,
    required this.deviceToken,
    required this.offers,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Top10NearestClinicModel.fromJson(Map<String, dynamic> json) {
    return Top10NearestClinicModel(
      location: Location.fromJson(json['location']),
      allowCalls: json['allowCalls'],
      id: json['_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      addressEn: json['address_en'],
      addressAr: json['address_ar'],
      availabilityEn: json['availability_en'],
      availabilityAr: json['availability_ar'],
      image: json['image'],
      phone: json['phone'],
      email: json['email'],
      specializations: (json['specializations'] as List)
          .map((e) => Specialization.fromJson(e))
          .toList(),
      doctors: List<String>.from(json['doctors']),
      deviceToken: json['deviceToken'],
      offers: json['offers'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }
}

class Specialization {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;
  final String createdAt;
  final String updatedAt;

  Specialization({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}