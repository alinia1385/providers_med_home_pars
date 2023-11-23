import 'package:dio/dio.dart';

class ModelProfileFormData {
  String? name;
  String? surname ;
  String? nationalCode;
  String? age;
  int? sex;


  ModelProfileFormData({this.name,this.surname,this.nationalCode,this.age,this.sex});

  ModelProfileFormData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    nationalCode = json['national_code'];
    age = json['age'];
    sex =json['sex'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['national_code'] = nationalCode;
    data['age'] = age;
    data['sex'] = sex;

    return data;
  }

  FormData toFormData() {
    FormData data = FormData.fromMap({
      "name": name,
      "surname": surname,
      "national_code": nationalCode,
      "age": age,
      "sex": sex,
    });
    return data;
  }
}
