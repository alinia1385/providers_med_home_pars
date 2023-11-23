import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:note_app/core/app.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/profile/data/model/ModelProfile.dart';
import 'package:note_app/feature/profile/data/model/profile_form_data.dart';

class ProfileRemote
{
  Future<BaseListDaynamic> getProfile() async {
    Response response = await App.client.get('profile');
    print(response.data);
    // return ModelProfile.fromJson(response.data);

    return BaseListDaynamic.fromJson(response.data);
  }


  Future<BaseListDaynamicStandard> setProfile(ModelProfileFormData value) async {
    Response response = await App.client.post('profile',data: value.toFormData());
    return BaseListDaynamicStandard.fromJson(response.data);
  }

  Future<BaseListDaynamic> setProfileImage(String value,String name) async {

    FormData formData = FormData.fromMap({
      'file': value,
      'filename':name
    });
    Response response = await App.client.post('profile_image',data: formData);
    return BaseListDaynamic.fromJson(response.data);
  }



}
