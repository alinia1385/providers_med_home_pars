import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_app/core/app.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/login/data/model/model_login_form_data.dart';
import 'package:note_app/feature/login/data/model/model_login_form_send_code_data.dart';
import 'package:note_app/feature/login/data/remote/login_remote.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  // late VideoPlayerController videoPlayerController;

  // RxBool isLoadVideo = false.obs;
  final FocusNode firstTextFieldFocusNode = FocusNode();
  final FocusNode secondTextFieldFocusNode = FocusNode();
  final FocusNode thirdTextFieldFocusNode = FocusNode();
  final FocusNode fourthTextFieldFocusNode = FocusNode();

  final Txt1 = TextEditingController();
  final Txt2 = TextEditingController();
  final Txt3 = TextEditingController();
  final Txt4 = TextEditingController();
  final mobile = TextEditingController();


  RxBool isDoctor=true.obs;
  RxBool isClinic=false.obs;
  RxBool isPhysiotherapy=false.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    // Map<String,dynamic> services=jsonText["data"]["services"];
    // List<String> key=[];
    // services.forEach((key_, value) {
    //   key.add(key_);
    // });
    // key.forEach((element) {
    //   ModelServices mServices=ModelServices.fromJson(services[element]);
    // });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    //videoPlayerController.dispose();
  }

  String replaceFarsiNumbertoenglish(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < farsi.length; i++) {
      input = input.replaceAll(farsi[i], english[i]);
    }
    return input;
  }

  final LoginRemote loginRemoteDatasource = LoginRemote();

  Future<BaseListDaynamicStandard> LoginServise() async {
    ModelLoginFormData formData= ModelLoginFormData();
    formData.mobile=mobile.text;
    final baseListDaynamic = await loginRemoteDatasource.getUser(formData);

    return baseListDaynamic;
  }

  RxBool stateResend=true.obs;
  Future<BaseListDaynamic> reSendServise() async {
    ModelLoginFormData formData= ModelLoginFormData();
    formData.mobile=mobile.text;
    final baseListDaynamic = await loginRemoteDatasource.reSendCode(formData);
    return baseListDaynamic;
  }


  Future<BaseListDaynamic> LoginServiseSetCode() async {
    ModelLoginFormDataSetCode values = ModelLoginFormDataSetCode();
    values.code = Txt1.text + Txt2.text + Txt3.text + Txt4.text;
    values.mobile = mobile.text;
    values.type= isDoctor.value ?"doctor":isClinic.value?"clinic":"therapist";
    AppController.to.type=values.type!;
    final baseListDaynamic = await loginRemoteDatasource.SetCode(values);

    if (baseListDaynamic.success!) {
      String token = baseListDaynamic.data!['token'].toString();
      await AppController.to.prefs.setString('token', token);
      App.client.options.headers["Authorization"] = "Bearer $token";
    }
    return baseListDaynamic;
  }
}
