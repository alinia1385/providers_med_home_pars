import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
import 'dart:js' as js;
import 'package:note_app/feature/patients_location/controller/location_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            margin: const EdgeInsets.only(right: 25, top: 10),
                            alignment: Alignment.centerRight,
                            width: Get.width * 0.11,
                            height: Get.height,
                            child: const Image(
                                image: AssetImage("assets/images/back.png")),
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
              child: Column(children: [
                Expanded(
                  flex: 3,
                  child:GestureDetector(
                      onTap: (){

                        /// js.context.callMethod('open', ['http://maps.google.com/?ll=${LocationController.to.latitude},${LocationController.to.longitude}']);
                        openMap(LocationController.to.latitude.toDouble(),LocationController.to.longitude.toDouble());
                      },

                      child: Container(child:Image.asset("assets/images/map.png",fit: BoxFit.cover),)
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
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          barrierDismissible: true,
                          content: Container(
                            padding: EdgeInsets.all(Get.width * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "تعیین وضعیت درخواست فعال",
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                                const Divider(
                                  color: Colors.transparent,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.06,
                                    width: Get.width * 0.5,
                                    decoration: const BoxDecoration(
                                      color: ColorConst.primaryDark,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
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
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.06,
                                    width: Get.width * 0.5,
                                    decoration: const BoxDecoration(
                                      color: ColorConst.primaryDark,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
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
                          titleStyle: const TextStyle(color: Colors.white),
                          middleTextStyle: const TextStyle(color: Colors.white),
                          radius: 30);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){

                          if(

                          LocationController.to.indexState.value<3

                          ){
                          Get.defaultDialog(
                              barrierDismissible: true,
                              contentPadding: EdgeInsets.zero,
                              title: "تعیین وضعیت درخواست ",
                              content: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [

                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      LocationController.to.getState(LocationController.to.status);
                                      LocationController.to.changeState()
                                          .then((value) {
                                        // LocationController.to.indexState.value++;
                                            Get.back();
                                        FxToast.showToast(
                                          context: context,
                                          toast: ToastWithoutColor.success(
                                            message: value.message!,
                                            icon: Icons.info_rounded,
                                          ),
                                          position: ToastPosition.topRight,
                                        );
                                       if(value.success!)
                                         {
                                           LocationController.to.indexState++;
                                         }
                                      });
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
                                      child:
                                        Text(
                                          LocationController.to.listState[LocationController.to.indexState.value+1],
                                          style: SizeButton,
                                        ),

                                    ),
                                  ),

                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      LocationController.to.getState(LocationController.to.indexState.value.toString());
                                      LocationController.to.changeState()
                                          .then((value) {

                                        Get.back();
                                        FxToast.showToast(
                                          context: context,
                                          toast: ToastWithoutColor.success(
                                            message: value.message!,
                                            icon: Icons.info_rounded,
                                          ),
                                          position: ToastPosition.topRight,
                                        );
                                        if(value.success!)
                                        {
                                          LocationController.to.indexState++;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.5,
                                      decoration:  BoxDecoration(
                                        color: ColorConst.primaryDark.withOpacity(0.6),
                                        borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(
                                                50)),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "کنسل",
                                        style: SizeButton,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.white,
                              titleStyle:
                              const TextStyle(color: Colors.black),
                              middleTextStyle:
                              const TextStyle(color: Colors.black),
                              titlePadding: EdgeInsets.zero,
                              radius: 30);}
                          else
                            {
                              FxToast.showToast(
                                context: context,
                                toast: ToastWithoutColor.success(
                                  message: "شما مجاز به تغییر وضعیت نمی باشد",
                                  icon: Icons.info_rounded,
                                ),
                                position: ToastPosition.topRight,
                              );
                            }
                        },
                        child: Obx(
                          ()=>Container(
                            alignment: Alignment.center,
                            height: Get.height * 0.07,
                            width: Get.width * 0.45,
                            decoration:  BoxDecoration(
                              color:  LocationController.to.indexState.value <3 ?ColorConst.primaryDark:Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Text(
                              "تایید",
                              style: SizeButton,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }


  Future<void> openMap(double latitude, double longitude) async {

    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
