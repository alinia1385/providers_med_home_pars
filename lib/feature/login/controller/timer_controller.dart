import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt countdown =18.obs;
  Timer? _timer;
  RxBool isWidgetVisible = true.obs;
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (countdown.value == 0) {
        timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void hideWidget() {
    isWidgetVisible.value = false;
  }

  void showWidget() {
    isWidgetVisible.value = true;
  }
}
