import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt countdown = 18.obs;
  RxBool isWidgetVisible = false.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown(); // تغییر نام متد به startCountdown
  }

  void startCountdown() {
    countdown.value = 8; // شروع تایمر از 18
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      countdown.value--;
      if (countdown.value == 0) {
        timer.cancel();
        isWidgetVisible.value = true; // نمایش دکمه ارسال کد
      }
    });
  }

  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  void hideWidget() {
    isWidgetVisible.value = false;
  }

  void showWidget() {
    startCountdown(); // شروع تایمر جدید برای مجدداً شمارش معکوس
  }
}