class CalendarDoctorModel {
  final String id;
  final String doctorId;
  final String clinicId;
  final String day;
  final String startTime;
  final String endTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  CalendarDoctorModel({
    required this.id,
    required this.doctorId,
    required this.clinicId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CalendarDoctorModel.fromJson(Map<String, dynamic> json) {
    return CalendarDoctorModel(
      id: json['_id'],
      doctorId: json['doctor'],
      clinicId: json['clinic'],
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'doctor': doctorId,
      'clinic': clinicId,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
