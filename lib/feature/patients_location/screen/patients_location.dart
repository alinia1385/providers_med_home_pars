import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/widget/ColorLoader3.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
import 'package:note_app/feature/patients_location/controller/location_controller.dart';

import 'package:url_launcher/url_launcher.dart';

class PatientsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
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
                                image: AssetImage("assets/images/back.png"),
                              ),
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
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: ColorConst.drawerBG,
                  child: Column(children: [
                    Expanded(
                      flex: 3,
                      child: LocationController.to.state.value == true
                          ? GestureDetector(
                              onTap: () {
                                /// js.context.callMethod('open', ['http://maps.google.com/?ll=${LocationController.to.latitude},${LocationController.to.longitude}']);
                                openMap(
                                    LocationController.to.latitude.toDouble(),
                                    LocationController.to.longitude.toDouble());
                              },
                              child: Image.asset("assets/images/map.png",
                                  fit: BoxFit.fitWidth))
                          : GestureDetector(
                              onTap: () {
                                Get.dialog(
                                    SizedBox(
                                      width: Get.width * 0.1,
                                      height: Get.width * 0.1,
                                      child: ColorLoader3(
                                        radius: 20,
                                        dotRadius: 5.0,
                                      ),
                                    ),
                                    barrierDismissible: false);

                                Get.back();

                                FxToast.showToast(
                                  context: context,
                                  toast: const ToastWithoutColor.success(
                                    message: "موقعیت مکانی وجود ندارد",
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "IRANSANCE",
                                        fontSize: 18),
                                    icon: Icons.info_rounded,
                                  ),
                                  position: ToastPosition.topRight,
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/images/map.png",
                                      fit: BoxFit.fitWidth),
                                  // Container(
                                  //   alignment: Alignment.center,
                                  //   child: const Icon(Icons.close,color: Colors.red,size:100),
                                  // ),
                                ],
                              ),
                            ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.02,
                            vertical: Get.height * 0.02),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppController.to.requestPersonal.description
                                              .toString()
                                              .length >
                                          4
                                      ? Text("نام و نام خانوادگی : ",
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              fontWeight: FontWeight.bold,
                                              color: ColorConst.black))
                                      : Container(),
                                  AppController.to.requestPersonal.description
                                              .toString()
                                              .length >
                                          4
                                      ? SingleChildScrollView(
                                          child: Text(
                                          "${AppController.to.requestPersonal.name} ${AppController.to.requestPersonal.surname}",
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              color: ColorConst.black),
                                        ))
                                      : Container(),
                                ],
                              ),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppController.to.requestPersonal.description
                                              .toString()
                                              .length >
                                          4
                                      ? Text("توضیحات : ",
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              fontWeight: FontWeight.bold,
                                              color: ColorConst.black))
                                      : Container(),
                                  AppController.to.requestPersonal.description
                                              .toString()
                                              .length >
                                          4
                                      ? SingleChildScrollView(
                                          child: Text(
                                          AppController
                                              .to.requestPersonal.description
                                              .toString(),
                                          maxLines: 2,
                                        ))
                                      : Container(),
                                ],
                              ),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppController.to.requestPersonal.address
                                              .toString()
                                              .length >
                                          4
                                      ? Text("ادرس : ",
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              fontWeight: FontWeight.bold,
                                              color: ColorConst.black))
                                      : Container(),
                                  AppController.to.requestPersonal.address
                                              .toString()
                                              .length >
                                          4
                                      ? Text(
                                          AppController
                                              .to.requestPersonal.address
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              color: ColorConst.black),
                                        )
                                      : Container(),
                                ],
                              ),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppController.to.requestPersonal.address
                                              .toString()
                                              .length >
                                          4
                                      ? Text("شماره تماس درخواست دهنده : ",
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              fontWeight: FontWeight.bold,
                                              color: ColorConst.black))
                                      : Container(),
                                  AppController.to.requestPersonal.address
                                              .toString()
                                              .length >
                                          4
                                      ? Text(
                                          AppController.to.requestPersonal.phone
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              color: ColorConst.black),
                                        )
                                      : Container(),
                                ],
                              ),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppController.to.requestPersonal.address
                                              .toString()
                                              .length >
                                          4
                                      ?Text("شماره تماس صاحب حساب : ",
                                            style: TextStyle(
                                                fontFamily: "IRANSANCE",
                                                fontSize: Get.width * 0.035,
                                                fontWeight: FontWeight.bold,
                                                color: ColorConst.black))
                                      : Container(),
                                  AppController.to.requestPersonal.address
                                              .toString()
                                              .length >
                                          4
                                      ? Text(
                                          AppController
                                              .to.requestPersonal.mobile
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: "IRANSANCE",
                                              fontSize: Get.width * 0.035,
                                              color: ColorConst.black))
                                      : Container(),
                                ],
                              ),
                            ],
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
                    GestureDetector(
                      onTap: () async {
                        controller.showProgress.value = true;
                        await Future.delayed(const Duration(milliseconds: 500));
                        controller.showProgress.value = false;
                        if (!controller.showProgress.value) {}
                        Get.defaultDialog(
                            barrierDismissible: true,
                            content: Container(
                              padding: EdgeInsets.all(Get.width * 0.01),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "تعیین وضعیت درخواست فعال",
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
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
                            middleTextStyle:
                                const TextStyle(color: Colors.white),
                            radius: 30);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              if (LocationController.to.indexState.value < 3) {
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
                                            LocationController.to
                                                .changeState()
                                                .then((value) {
                                              // Get.back();
                                              FxToast.showToast(
                                                context: context,
                                                toast:
                                                    ToastWithoutColor.success(
                                                  message: LocationController
                                                      .to.messages.value,
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "IRANSANCE",
                                                      fontSize: 18),
                                                  icon: Icons.info_rounded,
                                                ),
                                                position:
                                                    ToastPosition.topRight,
                                              );
                                            });
                                          },
                                          child: Container(
                                            height: Get.height * 0.06,
                                            width: Get.width * 0.5,
                                            decoration: const BoxDecoration(
                                              color: ColorConst.primaryDark,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              LocationController
                                                  .to.messages.value,
                                              style: SizeButton,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.transparent,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                            LocationController
                                                .to.indexState.value = 5;
                                          },
                                          child: Container(
                                            height: Get.height * 0.06,
                                            width: Get.width * 0.5,
                                            decoration: BoxDecoration(
                                              color: ColorConst.primaryDark
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50)),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "انصراف",
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
                                    radius: 30);
                              }
                            },
                          child: Obx(() {
                            if (LocationController.to.indexState.value == 3 ||
                                LocationController.to.indexState.value == 5) {
                              return
                             Container();
                            }
                            else{
                            return Container(
                            alignment: Alignment.center,
                            height: Get.height * 0.07,
                            width: Get.width * 0.45,
                            decoration: const BoxDecoration(
                            color: ColorConst.primaryDark,
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Text(
                            "ثبت مرحله بعد",
                            style: SizeButton,
                            ));
                            }
                          }
                          ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> openMap(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
