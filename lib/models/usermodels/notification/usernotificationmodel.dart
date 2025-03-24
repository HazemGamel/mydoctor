class UserNotificationsModel {
  final String id;
  final String user;
  final String titleEn;
  final String titleAr;
  final String messageEn;
  final String messageAr;
  final String type;
  final String reservation;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserNotificationsModel({
    required this.id,
    required this.user,
    required this.titleEn,
    required this.titleAr,
    required this.messageEn,
    required this.messageAr,
    required this.type,
    required this.reservation,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Factory method to create an instance from JSON
  factory UserNotificationsModel.fromJson(Map<String, dynamic> json) {
    return UserNotificationsModel(
      id: json["_id"],
      user: json["user"],
      titleEn: json["title_en"],
      titleAr: json["title_ar"],
      messageEn: json["message_en"],
      messageAr: json["message_ar"],
      type: json["type"],
      reservation: json["reservation"],
      isRead: json["isRead"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  /// Method to convert the model to JSON format
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "user": user,
      "title_en": titleEn,
      "title_ar": titleAr,
      "message_en": messageEn,
      "message_ar": messageAr,
      "type": type,
      "reservation": reservation,
      "isRead": isRead,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
