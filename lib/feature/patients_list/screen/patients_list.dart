import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/loader/loader.dart';
import 'package:note_app/feature/patients_list/controller/patients_list_controller.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

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
                                  margin: const EdgeInsets.only(right: 25,top: 10),
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
                      padding: EdgeInsets.all(Get.width * 0.03),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "عمومی",
                                style: TextStyle(
                                    fontFamily: "IRANSANCE",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConst.primaryDark),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.transparent,
                            height: Get.height * 0.05,
                          ),
                          Expanded(
                            child: Obx(() => PatientsListController
                                    .to.stateLoadData.value
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                    PatientsListController.to.listVisit.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () async{
                                              await Get.toNamed("/PatientsRequest");
                                            },
                                            child: Container(
                                              width: Get.width * 0.9,
                                              height: Get.height * 0.07,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(
                                                          Get.width * 0.04)),
                                                  color: PatientsListController.to.ItemStatus.value
                                                      ? Brwon
                                                      : ColorConst.primaryDark),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                        PatientsListController
                                                        .to
                                                        .listVisit[index]
                                                        .createdAt
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "IRANSANCE",
                                                        fontSize:
                                                            Get.width * 0.04),
                                                  )),
                                                  Expanded(
                                                      child: Text(
                                                        PatientsListController
                                                        .to
                                                        .listVisit[index]
                                                        .personType
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "IRANSANCE",
                                                        fontSize:
                                                            Get.width * 0.04),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.transparent,
                                          )
                                        ],
                                      );
                                    })
                                : Center(
                                child: SizedBox(
                                    width: Get.width * 0.3,
                                    height: Get.width * 0.3,
                                    child: FxLoader.cubeGridLoader(
                                        color: Colors.black12,
                                        size: Get.width * 0.15)))),
                          ),
                        ],
                      ),
                    )),

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
                            alignment: Alignment.center,
                          ),
                      ],
                    )),
              ],
            ),
          ));
  }
}
