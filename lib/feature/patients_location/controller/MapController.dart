import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapControllerC extends GetxController {
  static MapControllerC get to => Get.find<MapControllerC>();

  var latitude = 36.287241.obs;
  var longitude = 59.616426.obs;
  List<Marker> tmpMarker = [];
  late BuildContext tmpContext;
  LatLng? userLocation;
  RxDouble lat=36.287241.obs;
  RxDouble long=59.616426.obs;
  MapController mapController=MapController();
  RxBool showGreeting = false.obs;

  Future<void> getUserLocation() async {
    showGreeting.value=false;
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
      showGreeting.value = true;
    } else {

    }
  }
}