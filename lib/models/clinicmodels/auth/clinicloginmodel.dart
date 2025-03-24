class ClinicLoginModel {
  LocationModel location;
  String id;
  String nameEn;
  String nameAr;
  String descriptionEn;
  String descriptionAr;
  String addressEn;
  String addressAr;
  String availabilityEn;
  String availabilityAr;
  String image;
  String phone;
  String email;
  List<String> specializations;
  List<String> doctors;
  String deviceToken;
  List<dynamic> offers;
  String createdAt;
  String updatedAt;
  bool allowCalls;

  ClinicLoginModel({
    required this.location,
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
    required this.allowCalls,
  });

  factory ClinicLoginModel.fromJson(Map<String, dynamic> json) {
    return ClinicLoginModel(
      location: LocationModel.fromJson(json["location"]),
      id: json["_id"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      descriptionEn: json["description_en"],
      descriptionAr: json["description_ar"],
      addressEn: json["address_en"],
      addressAr: json["address_ar"],
      availabilityEn: json["availability_en"],
      availabilityAr: json["availability_ar"],
      image: json["image"],
      phone: json["phone"],
      email: json["email"],
      specializations: List<String>.from(json["specializations"]),
      doctors: List<String>.from(json["doctors"]),
      deviceToken: json["deviceToken"],
      offers: List<dynamic>.from(json["offers"]),
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      allowCalls: json["allowCalls"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location.toJson(),
      "_id": id,
      "name_en": nameEn,
      "name_ar": nameAr,
      "description_en": descriptionEn,
      "description_ar": descriptionAr,
      "address_en": addressEn,
      "address_ar": addressAr,
      "availability_en": availabilityEn,
      "availability_ar": availabilityAr,
      "image": image,
      "phone": phone,
      "email": email,
      "specializations": specializations,
      "doctors": doctors,
      "deviceToken": deviceToken,
      "offers": offers,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "allowCalls": allowCalls,
    };
  }
}

class LocationModel {
  String type;
  List<double> coordinates;

  LocationModel({
    required this.type,
    required this.coordinates,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json["type"],
      coordinates: List<double>.from(json["coordinates"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }
}
