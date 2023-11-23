
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



class SplashController extends GetxController {
  static SplashController get to => Get.find<SplashController>();

  // late VideoPlayerController videoPlayerController;

  // RxBool isLoadVideo = false.obs;
  late Timer timer;


  @override
  void onInit(){
    // TODO: implement onInit



    super.onInit();



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
      Get.offAndToNamed("Login");
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
