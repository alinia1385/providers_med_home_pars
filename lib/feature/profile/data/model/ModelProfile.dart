import 'package:dio/dio.dart';

class ModelProfile {
  int? id;
  String? image;
  String? name;
  String? surname;
  String? father;
  String? nationalCode;
  int? age;
  int? sex;
  String? cityId;
  String? nationality;
  String? education;
  String? email;
  String? mobile;
  String? phone;
  String? address;
  String? surveyId;
  String? description;
  String? targets;
  int? status;
  String? bloodImage;
  String? wallet;
  String? followDay;
  String? followTime;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ModelProfile(
      {this.id,
      this.image,
      this.name,
      this.surname,
      this.father,
      this.nationalCode,
      this.age,
      this.sex,
      this.cityId,
      this.nationality,
      this.education,
      this.email,
      this.mobile,
      this.phone,
      this.address,
      this.surveyId,
      this.description,
      this.targets,
      this.status,
      this.bloodImage,
      this.wallet,
      this.followDay,
      this.followTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ModelProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    surname = json['surname'];
    father = json['father'];
    nationalCode = json['national_code'];
    age = json['age'];
    sex = json['sex'];
    cityId = json['city_id'];
    nationality = json['nationality'];
    education = json['education'];
    email = json['email'];
    mobile = json['mobile'];
    phone = json['phone'];
    address = json['address'];
    surveyId = json['survey_id'];
    description = json['description'];
    targets = json['targets'];
    status = json['status'];
    bloodImage = json['blood_image'];
    wallet = json['wallet'];
    followDay = json['follow_day'];
    followTime = json['follow_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['father'] = this.father;
    data['national_code'] = this.nationalCode;
    data['age'] = this.age;
    data['sex'] = this.sex;
    data['city_id'] = this.cityId;
    data['nationality'] = this.nationality;
    data['education'] = this.education;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['survey_id'] = this.surveyId;
    data['description'] = this.description;
    data['targets'] = this.targets;
    data['status'] = this.status;
    data['blood_image'] = this.bloodImage;
    data['wallet'] = this.wallet;
    data['follow_day'] = this.followDay;
    data['follow_time'] = this.followTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }

  FormData getFormData() {
    FormData data = FormData.fromMap({
    'id':id,
    'image':image,
    'name':name,
    'surname':surname,
    'father':father,
    'national_code':nationalCode,
    'age':age,
    'sex':sex,
    'city_id':cityId,
    'nationality':nationality,
    'education':education,
    'email':email,
    'mobile':mobile,
    'phone':phone,
    'address':address,
    'survey_id':surveyId,
    'description':description,
    'targets':targets,
    'status':status,
    'blood_image':bloodImage,
    'wallet':wallet,
    'follow_day':followDay,
    'follow_time':followTime,
    'created_at':createdAt,
    'updated_at':updatedAt,
    'deleted_at':deletedAt,
  });
    return data;}
}
