import 'package:get/get.dart';
import 'package:note_app/feature/patients_location/controller/MapController.dart';


//
class MapInit implements Bindings{
  @override
  void dependencies() async{
    Get.put<MapControllerC>(MapControllerC());
  }
}