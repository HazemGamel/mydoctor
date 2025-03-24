class DoctorsInClinicModel {
  bool? allowCalls;
  String? id;
  String? nameEn;
  String? nameAr;
  String? image;
  String? phone;
  String? descriptionEn;
  String? descriptionAr;
  String? specialization;
  String? createdAt;
  String? updatedAt;
  List<DoctorCalendar>? calendar;

  DoctorsInClinicModel({
    this.allowCalls,
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.phone,
    this.descriptionEn,
    this.descriptionAr,
    this.specialization,
    this.createdAt,
    this.updatedAt,
    this.calendar,
  });

  factory DoctorsInClinicModel.fromJson(Map<String, dynamic> json) {
    return DoctorsInClinicModel(
      allowCalls: json["allowCalls"],
      id: json["_id"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      image: json["image"],
      phone: json["phone"],
      descriptionEn: json["description_en"],
      descriptionAr: json["description_ar"],
      specialization: json["specialization"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      calendar: json["calendar"] != null
          ? List<DoctorCalendar>.from(
              json["calendar"].map((x) => DoctorCalendar.fromJson(x)))
          : [],
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
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "calendar": calendar != null
          ? List<dynamic>.from(calendar!.map((x) => x.toJson()))
          : [],
    };
  }
}

class DoctorCalendar {
  String? id;
  String? doctorId;
  String? clinicId;
  String? day;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;

  DoctorCalendar({
    this.id,
    this.doctorId,
    this.clinicId,
    this.day,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorCalendar.fromJson(Map<String, dynamic> json) {
    return DoctorCalendar(
      id: json["_id"],
      doctorId: json["doctor"],
      clinicId: json["clinic"],
      day: json["day"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "doctor": doctorId,
      "clinic": clinicId,
      "day": day,
      "startTime": startTime,
      "endTime": endTime,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
