import 'package:get/get.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/controller/theme_controller.dart';
import 'package:note_app/core/controller/translation_controller.dart';

class MyBiding implements Bindings{
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => TranslationControlller());

  }
}