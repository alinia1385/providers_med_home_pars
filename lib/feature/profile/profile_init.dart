import 'package:get/get.dart';
import 'package:note_app/feature/profile/controller/profile_controller.dart';
import 'package:note_app/feature/splash/controller/splash_controller.dart';



//
class ProfileInit implements Bindings{
  @override
  void dependencies() async{
    Get.put<ProfileController>(ProfileController());

  }
}