import 'package:get/get.dart';
import 'package:note_app/feature/patients_location/controller/location_controller.dart';


//
class MapInit implements Bindings{
  @override
  void dependencies() async{
    Get.put<LocationController>(LocationController());
  }
}