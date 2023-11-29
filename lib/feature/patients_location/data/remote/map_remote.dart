import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:note_app/core/app.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/login/date/model/model_login_form_data.dart';
import 'package:note_app/feature/login/date/model/model_login_form_send_code_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapRemote
{

  Future<BaseListDaynamic> changeState(String state,String request_id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token= await prefs.getString('token');
    App.client.options.headers["Authorization"] = "Bearer $token";
    App.client.options.headers["Accept"] = "application/json";
    FormData data = FormData.fromMap({
      "request_id": request_id,
      "state": state,
    });
    Response response = await App.client.post('op/services/request/status',data: data);
    return BaseListDaynamic.fromJson(response.data);
  }



}
