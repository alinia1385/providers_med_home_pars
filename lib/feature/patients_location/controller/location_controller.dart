import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/feature/patients_location/data/remote/map_remote.dart';

class LocationController extends GetxController {
  static LocationController get to => Get.find<LocationController>();
  final MapRemote MapRemoteDatasource = MapRemote();

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    String tmpData = argumentData[0]['lat-long'].toString();
    if (tmpData.length > 5) {
      var data = tmpData.split(",");
      latitude.value = double.parse(data[0].toString().trim());
      longitude.value = double.parse(data[1].toString().trim());
    }
    status = argumentData[1]['status'].toString();
    request_id = argumentData[2]['request_id'].toString();
    getState(status);
  }

  RxBool progressBar = true.obs;
  RxBool showProgress = false.obs;
  RxBool dialogStatus = true.obs;
  String status = "";
  String request_id = "";
  var latitude = 36.287241.obs;
  var longitude = 59.616426.obs;
  List<Marker> tmpMarker = [];
  late BuildContext tmpContext;
  LatLng? userLocation;
  RxDouble lat = 36.287241.obs;
  RxDouble long = 59.616426.obs;
  MapController mapController = MapController();

  Future<void> getUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      userLocation = LatLng(latitude.value, longitude.value);
      mapController.move(LatLng(latitude.value, longitude.value), 10);
    } else {}
  }

  RxString rxState = "".obs;
  RxInt indexState = 0.obs;
  RxString messages = "".obs;

  getState(String data) {
    print(data);
    Map<String, Map<String, dynamic>> a = {
      "new": {"id": 0.obs, "text": "درخواست خدمت".obs,"message":"درخواست جدید".obs},
      "accept": {"id": 1.obs, "text": "شروع خدمت".obs,"message":"درخواست قبول شد".obs},
      "arrive": {"id": 2.obs, "text": "در مسیر خدمت".obs,"message":"رسیدن به محل خدمت".obs},
      "finish": {"id": 3.obs, "text": "اتمام خدمت".obs,"message":"اتمام خدمت".obs},
      "cancel": {"id": 4.obs, "text": "انصراف از خدمت".obs,"message":"درخواست لغو شد".obs},
    };
    indexState = a[data]?["id"] ?? 0.obs;
    // print(a[data]?["text"]??"درخواست خدمت".obs);
    rxState = a[data]?["text"]??"درخواست خدمت".obs;
    messages = a[data]?["message"]??"درخواست جدید".obs;
  }

  RxBool changeStateValue = false.obs;
  List<String> listState = ["new", "accept", "arrive", "finish", "cancel"];

  Future<BaseListDaynamic> changeState() async {
    indexState.value += 1;
    status = listState[indexState.value];

    changeStateValue.value = false;

    //print(indexState.v print(listState[indexState.value+1]);alue);
    final baseListDaynamic = await MapRemoteDatasource.changeState(
        listState[indexState.value], request_id);
    changeStateValue.value = true;
    getState(status);
    return baseListDaynamic;
  }
}
