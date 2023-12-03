
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:note_app/core/app.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashController extends GetxController {
  static SplashController get to => Get.find<SplashController>();

  // late VideoPlayerController videoPlayerController;

  // RxBool isLoadVideo = false.obs;
  late Timer timer;

  String data = "";

  @override
  void onInit() async{
    // TODO: implement onInit



    super.onInit();

    final tmpPrefs = await SharedPreferences.getInstance();

    data = await tmpPrefs.getString("token").toString();
      splashTimer();


    //initializaPlayer();

  }

  splashTimer()
  {
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      // if (checkVideo()) {
      //   timer.cancel();
      //   Get.offAndToNamed("Login");
      // }
      timer.cancel();

      if(!data.contains("null"))
        {
          App.client.options.headers["Authorization"] = "Bearer $data";
          Get.offAllNamed("/VisitHome");
        }else
          {
            Get.offAllNamed("/Login");
          }
    });
  }








  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    //videoPlayerController.dispose();
  }

}
