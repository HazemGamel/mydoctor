
import 'dart:convert';

class OrdersForAllDoctorsModel {
  final String id;
  final Patient patient;
  final Doctor doctor;
  final Clinic clinic;
  final String notes;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrdersForAllDoctorsModel({
    required this.id,
    required this.patient,
    required this.doctor,
    required this.clinic,
    required this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrdersForAllDoctorsModel.fromJson(Map<String, dynamic> json) {
    return OrdersForAllDoctorsModel(
      id: json["_id"],
      patient: Patient.fromJson(json["patient"]),
      doctor: Doctor.fromJson(json["doctor"]),
      clinic: Clinic.fromJson(json["clinic"]),
      notes: json["notes"],
      status: json["status"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "patient": patient.toJson(),
      "doctor": doctor.toJson(),
      "clinic": clinic.toJson(),
      "notes": notes,
      "status": status,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

// 📌 موديل المريض (Patient)
class Patient {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final int age;
  final bool verified;
  final String image;
  final String deviceToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.age,
    required this.verified,
    required this.image,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      gender: json["gender"],
      age: json["age"],
      verified: json["verified"],
      image: json["image"],
      deviceToken: json["deviceToken"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "age": age,
      "verified": verified,
      "image": image,
      "deviceToken": deviceToken,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

// 📌 موديل الطبيب (Doctor)
class Doctor {
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
  final bool allowCalls;

  Doctor({
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
    required this.allowCalls,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json["_id"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      image: json["image"],
      phone: json["phone"],
      descriptionEn: json["description_en"],
      descriptionAr: json["description_ar"],
      specialization: json["specialization"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      allowCalls: json["allowCalls"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      "allowCalls": allowCalls,
    };
  }
}

// 📌 موديل العيادة (Clinic)
class Clinic {
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
  final List<String> specializations;
  final List<String> doctors;
  final String deviceToken;
  final bool allowCalls;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Location location;

  Clinic({
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
    required this.allowCalls,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
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
      allowCalls: json["allowCalls"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      location: Location.fromJson(json["location"]),
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
      "specializations": specializations,
      "doctors": doctors,
      "deviceToken": deviceToken,
      "allowCalls": allowCalls,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "location": location.toJson(),
    };
  }
}

// 📌 موديل الموقع (Location)
class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"],
      coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }
}
