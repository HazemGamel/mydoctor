import 'package:flutter/material.dart';

class ClinicsBasedonSpecializationModel {
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
  final List<Doctor> doctors;
  final String deviceToken;
  final List<dynamic> offers;
  final bool allowCalls;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Location location;

  ClinicsBasedonSpecializationModel({
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
    required this.allowCalls,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
  });

  factory ClinicsBasedonSpecializationModel.fromJson(Map<String, dynamic> json) {
    return ClinicsBasedonSpecializationModel(
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
      doctors: (json['doctors'] as List).map((e) => Doctor.fromJson(e)).toList(),
      deviceToken: json['deviceToken'],
      offers: json['offers'] ?? [],
      allowCalls: json['allowCalls'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'address_en': addressEn,
      'address_ar': addressAr,
      'availability_en': availabilityEn,
      'availability_ar': availabilityAr,
      'image': image,
      'phone': phone,
      'email': email,
      'specializations': specializations.map((e) => e.toJson()).toList(),
      'doctors': doctors.map((e) => e.toJson()).toList(),
      'deviceToken': deviceToken,
      'offers': offers,
      'allowCalls': allowCalls,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'location': location.toJson(),
    };
  }
}

class Specialization {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

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
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Doctor {
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

  Doctor({
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

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      allowCalls: json['allowCalls'],
      id: json['_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      image: json['image'],
      phone: json['phone'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      specialization: json['specialization'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allowCalls': allowCalls,
      '_id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'phone': phone,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'specialization': specialization,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}
