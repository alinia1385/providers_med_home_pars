
import 'package:note_app/core/app.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppController extends GetxController with StateMixin
{

  static AppController get to => Get.find<AppController>();
  RxBool isLandscape_=false.obs;
  String lat ="";
  String lng ="";


  late final prefs;
  int idService=-1;

   @override
  void onInit() async{
    await App.init();
    // TODO: implement onInit
    super.onInit();
     prefs = await SharedPreferences.getInstance();
  }

}