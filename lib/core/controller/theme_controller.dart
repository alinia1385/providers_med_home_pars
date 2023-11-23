import 'package:get/get.dart';

class ThemeController extends GetxController{
  static ThemeController get to => Get.find<ThemeController>();
  var Dark = false.obs;
  void ChangeTheme (){
    Dark.value = !Dark.value;
  }
}