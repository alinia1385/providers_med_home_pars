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
    // TODO: implement onInit
    super.onInit();
    String tmpData=argumentData[0]['lat-long'].toString();
    if(tmpData.length>5)
      {
        var data=tmpData.split(",");
        latitude.value=double.parse(data[0].toString().trim());
        longitude.value=double.parse(data[1].toString().trim());
      }
    status= argumentData[1]['status'].toString();
    request_id=argumentData[2]['request_id'].toString();
    getState(status);



  }
  RxBool progressBar = true.obs;
  RxBool dialogStatus = true.obs;
  String status="";
  String request_id="";
  var latitude = 36.287241.obs;
  var longitude = 59.616426.obs;
  List<Marker> tmpMarker = [];
  late BuildContext tmpContext;
  LatLng? userLocation;
  RxDouble lat=36.287241.obs;
  RxDouble long=59.616426.obs;
  MapController mapController=MapController();


  Future<void> getUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      userLocation = LatLng(latitude.value, longitude.value);
      mapController.move(LatLng(latitude.value, longitude.value), 10);
    } else {

    }
  }


  RxString rxState="".obs;
  RxInt indexState=0.obs;
  getState(String data)
  {

    switch(data)
    {
      case "new":rxState.value="درخواست خدمت";indexState.value=0 ;break;
      case "accept":rxState.value="شروع خدمت"; indexState.value=1;break;
      case "arrived":rxState.value="در مسیر خدمت";indexState.value=2; break;
      case "finish":rxState.value="اتمام خدمت"; indexState.value=3;break;
      case "cancel":rxState.value="انصراف از خدمت";indexState.value=4; break;
    }

  }

  RxBool changeStateValue = false.obs;
  List<String> listState=["new","accept","arrive","finish","cancel"];
  Future<BaseListDaynamic> changeState() async {
    changeStateValue.value = false;

    //print(indexState.v print(listState[indexState.value+1]);alue);
    final baseListDaynamic = await MapRemoteDatasource.changeState(listState[indexState.value], request_id);
    changeStateValue.value = true;
    return baseListDaynamic;
  }
}