import 'package:get/get.dart';
import 'package:note_app/feature/home_visit/controller/HomeVisitController.dart';
import 'package:note_app/feature/login/controller/login_controller.dart';
import 'package:note_app/feature/login/screen/login.dart';
import 'package:note_app/feature/patients_list/controller/patients_list_controller.dart';
import 'package:note_app/feature/patients_request/controller/patients_request_controller.dart';
import 'package:note_app/feature/splash/controller/splash_controller.dart';



//
class PatientsRequestInit implements Bindings{
  @override
  void dependencies() async{
    Get.put<PatientsRequestController>(PatientsRequestController());

  }
}