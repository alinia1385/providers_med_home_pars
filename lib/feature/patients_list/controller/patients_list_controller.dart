import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:note_app/core/app.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/home_visit/data/model/model_service_item.dart';
import 'package:note_app/feature/home_visit/data/model/model_services.dart';
import 'package:note_app/feature/home_visit/data/remote/home_visit_remote.dart';
import 'package:note_app/feature/login/date/model/model_login_form_send_code_data.dart';

import 'package:note_app/feature/login/date/remote/login_remote.dart';
import 'package:note_app/feature/patients_list/data/model/model_list_visit.dart';
import 'package:note_app/feature/patients_list/data/model/model_requests.dart';
import 'package:note_app/feature/patients_list/data/remote/patients_list_remote.dart';

class PatientsListController extends GetxController {
  static PatientsListController get to => Get.find<PatientsListController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPersonalList();
  }



  final PatientsListRemote PatientsListRemoteDatasource = PatientsListRemote();

  RxBool ItemStatus = false.obs;

  RxBool stateLoadData = false.obs;
  List<ModelRequests> listPersonal = [];

  Future<BaseListDaynamic> getPersonalList() async {
    listPersonal.clear();
    stateLoadData.value = false;
    final baseListDaynamic = await PatientsListRemoteDatasource.getPatientsList();

    List<dynamic> tmpData = baseListDaynamic.data!["requests"];
    for (var element in tmpData) {
      listPersonal.add(ModelRequests.fromJson(element));
      print(element.toString());
    }
    stateLoadData.value = true;
    return baseListDaynamic;
  }




}
