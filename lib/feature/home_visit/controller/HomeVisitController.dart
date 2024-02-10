import 'dart:async';
import 'package:get/get.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/feature/home_visit/data/model/model_services.dart';
import 'package:note_app/feature/home_visit/data/remote/home_visit_remote.dart';

class HomeVisitController extends GetxController {
  static HomeVisitController get to => Get.find<HomeVisitController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServicesList();
  }

  final HomeVisitRemote homeVisiRemoteDatasource = HomeVisitRemote();
  List<dynamic> dataValueMaster = [];
  RxBool stateLoadData = false.obs;

  Future<BaseListDaynamic> getServicesList() async {
    stateLoadData.value = false;
    final baseListDaynamic = await homeVisiRemoteDatasource.getServices();
    dataValueMaster = baseListDaynamic.data!["services"];
    loadData();
    stateLoadData.value = true;
    return baseListDaynamic;
  }

  List<ModelServices> listData = [];

  loadData() {
    listData.clear();
    for (var element in dataValueMaster) {
      listData.add(ModelServices.fromJson(element));
    }
  }
}
