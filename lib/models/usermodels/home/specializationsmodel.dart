class SpecializationsModel {
  String? sId;
  String? nameEn;
  String? nameAr;
  String? descriptionEn;
  String? descriptionAr;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SpecializationsModel(
      {this.sId,
      this.nameEn,
      this.nameAr,
      this.descriptionEn,
      this.descriptionAr,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SpecializationsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['description_en'] = descriptionEn;
    data['description_ar'] = descriptionAr;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
