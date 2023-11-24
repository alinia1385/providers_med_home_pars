import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:note_app/core/app.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/login/date/model/model_login_form_data.dart';
import 'package:note_app/feature/login/date/model/model_login_form_send_code_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListVisitRemote
{

  Future<BaseListDaynamic> getListVisit() async {
   final prefs = await SharedPreferences.getInstance();
   String? token= await prefs.getString('token');
    App.client.options.headers["Authorization"] = "Bearer $token";
    App.client.options.headers["Accept"] = "application/json";
    Response response = await App.client.get('services/used');
    print(response.data);
    return BaseListDaynamic.fromJson(response.data);
  }

}
