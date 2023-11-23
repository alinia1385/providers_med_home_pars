import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TranslationControlller extends GetxController{
  static TranslationControlller get to => Get.find<TranslationControlller>();
  void ChangeLanguage (String Language) {
    var locale = Locale(Language);
    Get.updateLocale(locale);
  }

}