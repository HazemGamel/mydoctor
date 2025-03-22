class BannersModel {
  String? sId;
  String? title;
  String? image;
  String? link;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BannersModel(
      {this.sId,
      this.title,
      this.image,
      this.link,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BannersModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    link = json['link'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['link'] = this.link;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}