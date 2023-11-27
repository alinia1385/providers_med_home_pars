import 'package:dio/dio.dart';

class ModelLoginFormData {
  String? mobile;
  String? type;


  ModelLoginFormData({this.mobile});

  ModelLoginFormData.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['mobile'] = mobile;
    data['type'] = type;

    return data;
  }

  FormData toFormData() {
    FormData data = FormData.fromMap({
      "mobile": mobile,
      "type": type,
    });
    return data;
  }
}
