import 'package:get/get.dart';
import 'package:note_app/feature/splash/controller/splash_controller.dart';



//
class SplashInit implements Bindings{
  @override
  void dependencies() async{
    Get.put<SplashController>(SplashController());
  }
}