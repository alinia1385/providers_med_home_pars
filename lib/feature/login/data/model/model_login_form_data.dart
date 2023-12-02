import 'package:dio/dio.dart';

class ModelLoginFormData {
  String? mobile;


  ModelLoginFormData({this.mobile});

  ModelLoginFormData.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['mobile'] = mobile;
    return data;
  }

  FormData toFormData() {
    FormData data = FormData.fromMap({
      "mobile": mobile,
    });
    return data;
  }
}
