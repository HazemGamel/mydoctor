import 'package:flutter/foundation.dart';

class SearchModel {
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
  final List<SpecializationModel> specializations;
  final List<String> doctors;
  final String deviceToken;
  final List<dynamic> offers;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool allowCalls;
  final LocationModel location;

  SearchModel({
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
    required this.location,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
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
          .map((e) => SpecializationModel.fromJson(e))
          .toList(),
      doctors: List<String>.from(json['doctors']),
      deviceToken: json['deviceToken'],
      offers: json['offers'] ?? [],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      allowCalls: json['allowCalls'],
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      "specializations": specializations.map((e) => e.toJson()).toList(),
      "doctors": doctors,
      "deviceToken": deviceToken,
      "offers": offers,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "allowCalls": allowCalls,
      "location": location.toJson(),
    };
  }
}

class SpecializationModel {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  SpecializationModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      id: json['_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name_en": nameEn,
      "name_ar": nameAr,
      "description_en": descriptionEn,
      "description_ar": descriptionAr,
      "image": image,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

class LocationModel {
  final String type;
  final List<double> coordinates;

  LocationModel({required this.type, required this.coordinates});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }
}
