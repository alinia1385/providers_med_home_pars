import 'dart:async';
import 'package:get/get.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/feature/patients_request/data/model/model_list_visit.dart';
import 'package:note_app/feature/patients_request/data/remote/list_visit_remote.dart';



class PatientsRequestController extends GetxController {
  static PatientsRequestController get to => Get.find<PatientsRequestController>();








  @override
  void onInit(){
    // TODO: implement onInit
    super.onInit();
    getServicesList();
  }




  final  ListVisitRemote ListVisiRemoteDatasource =  ListVisitRemote();

  RxBool ItemStatus = false.obs;

  RxBool stateLoadData=false.obs;
  List<ModelListVisit> listVisit=[];
  Future<BaseListDaynamic> getServicesList()async
  {
    listVisit.clear();
    stateLoadData.value=false;
    final baseListDaynamic =
    await ListVisiRemoteDatasource.getListVisit();

    List<dynamic> tmpData=baseListDaynamic.data!["used_services"];
    for (var element in tmpData) {
      listVisit.add(ModelListVisit.fromJson(element));
    }
    stateLoadData.value=true;
    return baseListDaynamic;
  }





}
