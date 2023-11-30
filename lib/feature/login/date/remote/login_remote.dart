import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:note_app/core/app.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/login/date/model/model_login_form_data.dart';
import 'package:note_app/feature/login/date/model/model_login_form_send_code_data.dart';

class LoginRemote
{
  Future<BaseListDaynamicStandard> getUser(ModelLoginFormData formData) async {

    Response response = await App.client.post('op/login', data:formData.toFormData());
    return BaseListDaynamicStandard.fromJson(response.data);
  }
  Future<BaseListDaynamic> SetCode(ModelLoginFormDataSetCode values) async {
    Response response = await App.client.post('op/code-verify', data:values.toFormData());
    return BaseListDaynamic.fromJson(response.data);
  }
  Future<BaseListDaynamic> reSendCode(ModelLoginFormData values) async {
    Response response = await App.client.post('resend-code', data:values.toFormData());
    return BaseListDaynamic.fromJson(response.data);
  }
}
