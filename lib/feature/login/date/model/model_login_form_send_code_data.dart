import 'package:dio/dio.dart';

class ModelLoginFormDataSetCode {
  String? mobile;
  String? code;


  ModelLoginFormDataSetCode({this.mobile,this.code});

  ModelLoginFormDataSetCode.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    code = json['code'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  new Map<String, dynamic>();
    data['mobile'] = mobile;
    data['code'] = code;

    return data;
  }

  FormData toFormData() {
    FormData data = FormData.fromMap({
      "mobile": mobile,
      "code": code,
    });
    return data;
  }
}
