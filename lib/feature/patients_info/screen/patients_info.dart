import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/widget/ColorLoader3.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';

class PatientsInfo extends StatelessWidget {
  const PatientsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    AppController.to.isLandscape_.value = context.isLandscape;
    return Obx(() => AppController.to.isLandscape_.value
        ? Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/rotate.png",
              width: Get.width * 0.5,
              height: Get.height * 0.5,
            ),
          )
        : Scaffold(
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
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                    "مشخصات بیمار",
                                    style: TextStyle(
                                        fontFamily: "IRANSANCE",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConst.primaryDark),
                                  ),
                            ),
                          ),
                            Expanded(
                                flex: 3,
                                child: Container()),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  Get.toNamed("patients_location");
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
                                          "مشاهده روی نقشه",
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
          ));
  }
}
