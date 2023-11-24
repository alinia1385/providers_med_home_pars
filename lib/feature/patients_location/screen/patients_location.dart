import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/feature/patients_location/controller/MapController.dart';

class patients_location extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<patients_location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              margin:
                              const EdgeInsets.only(right: 25, top: 10),
                              alignment: Alignment.centerRight,
                              width: Get.width * 0.11,
                              height: Get.height,
                              child: const Image(
                                  image:
                                  AssetImage("assets/images/back.png")),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(left: Get.width * 0.02),
                        alignment: Alignment.bottomLeft,
                        width: Get.width,
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: Get.width * 0.2,
                          height: Get.width * 0.2,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 8,
              child: Container(
                color: ColorConst.drawerBG,
                child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Obx(
                              () => FlutterMap(
                              options: MapOptions(
                                center: LatLng(MapControllerC.to.latitude.value,
                                    MapControllerC.to.longitude.value),
                                minZoom: 1,
                                maxZoom: 20,
                                zoom: 10,
                              ),
                              layers: [
                                TileLayerOptions(
                                  urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                ),
                                MarkerLayerOptions(
                                  markers: [
                                    Marker(
                                      point: LatLng(
                                          MapControllerC.to.latitude.value,
                                          MapControllerC.to.longitude.value),
                                      builder: (context) => const Icon(
                                        Icons.location_pin,
                                        color: Colors.red,
                                        size: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              mapController: MapControllerC.to.mapController),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container()),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            Get.defaultDialog(
                              barrierDismissible: true,
                                content: Container(
                                  padding:
                                  EdgeInsets.all(Get.width * 0.01),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "تعیین وضعیت درخواست فعال",
                                        style: TextStyle(
                                            fontSize: Get.width * 0.04),
                                      ),
                                      const Divider(
                                        color: Colors.transparent,
                                      ),

                                      GestureDetector(
                                        onTap: () {
                                        },
                                        child: Container(
                                          height: Get.height * 0.06,
                                          width: Get.width * 0.5,
                                          decoration: const BoxDecoration(
                                            color: ColorConst.primaryDark,
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(
                                                    50)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "مشخصات",
                                            style: SizeButton,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.transparent,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                        },
                                        child: Container(
                                          height: Get.height * 0.06,
                                          width: Get.width * 0.5,
                                          decoration: const BoxDecoration(
                                            color: ColorConst.primaryDark,
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(
                                                    50)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "وضعیت",
                                            style: SizeButton,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                titleStyle:
                                const TextStyle(color: Colors.white),
                                middleTextStyle:
                                const TextStyle(color: Colors.white),
                                radius: 30);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              height: Get.height * 0.07,
                              width: Get.width * 0.45,
                              decoration: const BoxDecoration(
                                color: ColorConst.primaryDark,
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Text(
                                "تایید",
                                style: SizeButton,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.45,
                      decoration: const BoxDecoration(
                        color: ColorConst.white,
                      ),
                    ),
                  ],
                )),
          ],
        ),
        );
  }
}
