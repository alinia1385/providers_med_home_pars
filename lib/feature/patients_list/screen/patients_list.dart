import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/const/url.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/loader/loader.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
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
                          height: Get.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: Get.width * 0.04),
                                  alignment: Alignment.centerLeft,
                                  width: Get.width * 0.1,
                                  height: Get.height * 0.1,
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
                            height: Get.height * 0.02,
                          ),
                          Expanded(
                            child:
                                Obx(
                                    () =>
                                        PatientsListController
                                                .to.stateLoadData.value
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    PatientsListController
                                                        .to.listPersonal.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          await Get.toNamed(
                                                              "/PatientsRequest");
                                                        },
                                                        child: Container(
                                                          width:
                                                              Get.width * 0.95,
                                                          height: Get.height *
                                                              0.157,

                                                          // decoration: BoxDecoration(
                                                          //     borderRadius: BorderRadius
                                                          //         .all(Radius.circular(
                                                          //             Get.width * 0.04)),
                                                          //     color: PatientsListController
                                                          //             .to.ItemStatus.value
                                                          //         ? Brwon
                                                          //         : ColorConst.primaryDark.withOpacity(opacity)),

                                                          child: Stack(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          AppController.to.stateRequest = PatientsListController
                                                                              .to
                                                                              .listPersonal[index]
                                                                              .status
                                                                              .toString();

                                                                          Get.toNamed(
                                                                              "/patients_location",
                                                                              arguments: [
                                                                                {
                                                                                  "lat-long": PatientsListController.to.listPersonal[index].latlong.toString()
                                                                                },
                                                                                {
                                                                                  "status": PatientsListController.to.listPersonal[index].status.toString()
                                                                                },
                                                                                {
                                                                                  "request_id": PatientsListController.to.listPersonal[index].id.toString()
                                                                                },
                                                                              ]);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.only(right: Get.width * 0.11),
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: PatientsListController.to.ItemStatus.value
                                                                                ? Brwon
                                                                                : ColorConst.primaryDark,
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(Get.width * 0.01)),
                                                                          ),
                                                                          margin:
                                                                              EdgeInsets.symmetric(vertical: Get.height * 0.02),
                                                                          child:
                                                                              Text(
                                                                            "${PatientsListController.to.listPersonal[index].name}${PatientsListController.to.listPersonal[index].surname}",
                                                                            style: const TextStyle(
                                                                                fontFamily: "IRANSANCE",
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: ColorConst.white),
                                                                          ),
                                                                        ),
                                                                      )),
                                                                  Expanded(
                                                                    child:
                                                                        Container(),
                                                                    flex: 1,
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            Get.width *
                                                                                0.01,
                                                                        vertical:
                                                                            Get.height *
                                                                                0.01),
                                                                    child: Container(
                                                                        alignment: Alignment.center,
                                                                        width: Get.width * 0.25,
                                                                        height: Get.height,
                                                                        child: CircleAvatar(
                                                                          radius:
                                                                              Get.width * 0.25,
                                                                          backgroundImage:
                                                                              NetworkImage(BASEURLPROFILEIMAGE + PatientsListController.to.listPersonal[index].image.toString()),
                                                                        )),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                })
                                            : Center(
                                                child: SizedBox(
                                                    width: Get.width * 0.3,
                                                    height: Get.width * 0.3,
                                                    child:
                                                        FxLoader.cubeGridLoader(
                                                            color:
                                                                Colors.black12,
                                                            size: Get.width *
                                                                0.15)))),
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
