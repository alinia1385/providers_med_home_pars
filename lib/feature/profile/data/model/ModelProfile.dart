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
  int? wallet;
  String? followDay;
  String? followTime;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? phone1;
  String? phone2;
  String? owner_name;
  String? owner_surname;
  String? owner_mobile;
  int? msn;
  String? specialty;
  String? type;


  ModelProfile({
    this.id,
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
    this.phone1,
    this.phone2,
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
    this.deletedAt,
    this.owner_name,
    this.owner_surname,
    this.owner_mobile,
    this.msn,
    this.specialty,
    this.type,
  });

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
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    owner_name = json['owner_name'];
    owner_surname = json['owner_surname'];
    owner_mobile = json['owner_mobile'];
    msn = json['msn'];
    specialty = json['specialty'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['surname'] = surname;
    data['father'] = father;
    data['national_code'] = nationalCode;
    data['age'] = age;
    data['sex'] = sex;
    data['city_id'] = cityId;
    data['nationality'] = nationality;
    data['education'] = education;
    data['email'] = email;
    data['mobile'] = mobile;
    data['phone'] = phone;
    data['address'] = address;
    data['survey_id'] = surveyId;
    data['description'] = description;
    data['targets'] = targets;
    data['status'] = status;
    data['blood_image'] = bloodImage;
    data['wallet'] = wallet;
    data['follow_day'] = followDay;
    data['follow_time'] = followTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;

    data['phone1'] = phone1;
    data['phone2'] = phone2;

    data['owner_name'] = owner_name;
    data['owner_surname'] = owner_surname;
    data['owner_mobile'] = owner_mobile;
    data['msn'] = msn;
    data['specialty'] = specialty;
    data['type'] = type;

    return data;
  }

  FormData toFormData() {

    FormData data = FormData.fromMap({
      'id': id,
      'image': image,
      'name': name,
      'surname': surname,
      'father': father,
      'national_code': nationalCode,
      'age': age,
      'sex': sex,
      'city_id': cityId,
      'nationality': nationality,
      'education': education,
      'email': email,
      'phone': phone,
      'address': address,
      'survey_id': surveyId,
      'description': description,
      'targets': targets,
      'status': status,
      'blood_image': bloodImage,
      'wallet': wallet,
      'follow_day': followDay,
      'follow_time': followTime,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'phone1': phone1,
      'phone2': phone2,
      'owner_name': owner_name,
      'owner_surname': owner_surname,
      'owner_mobile': owner_mobile,
      'msn': msn,
      'specialty': specialty,
      'type': type,
      'phone1':phone1,
      'phone2':phone2,
    });
    print(data);
    return data;
  }
}
