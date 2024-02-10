import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/url.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/loader/loader.dart';
import 'package:note_app/feature/home_visit/controller/HomeVisitController.dart';

class VisitHome extends StatelessWidget {
  const VisitHome({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 10;
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
                                  Get.toNamed("/Profile");
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(right: 25,top: 10),
                                    alignment: Alignment.centerRight,
                                    width: Get.width * 0.11,
                                    height: Get.height,
                                    child: const CircleAvatar(
                                      backgroundColor: ColorConst.primaryDark,
                                      child:Icon(Icons.person,
                                        color: Colors.white,),
                                    )
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
                        padding: EdgeInsets.all(Get.width * 0.02),
                        color: ColorConst.drawerBG,
                        child: Obx(() => HomeVisitController
                                .to.stateLoadData.value
                            ? GridView.count(
                                crossAxisCount: 2,
                                children: List.generate(
                                  HomeVisitController.to.listData.length,
                                  (index) {
                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Get.width * 0.06)),
                                          color: ColorConst.primaryDark,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.02,
                                            vertical: Get.width * 0.02),
                                        margin:
                                            EdgeInsets.all(Get.width * 0.02),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              BASEURLPROFILEIMAGE+HomeVisitController.to.listData[index].icon.toString(),
                                              width: Get.width * 0.3,
                                              height: Get.width * 0.3,
                                              color: HomeVisitController.to
                                                      .listData[index].cnt==1
                                                  ? Colors.transparent
                                                  : Colors.grey,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: Get.width * 0.003),
                                              child: Text(
                                                HomeVisitController
                                                    .to.listData[index].title!,
                                                style: const TextStyle(
                                                    fontFamily: "IRANSANCE",
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        AppController.to.idService =
                                        HomeVisitController
                                            .to.listData[index]!.serviceId!;
                                        Get.toNamed("/PatientsList");
                                      },
                                    );
                                  },
                                ))
                            : Center(
                                child: Container(
                                    width: Get.width * 0.3,
                                    height: Get.width * 0.3,
                                    child: FxLoader.cubeGridLoader(
                                        color: Colors.black12,
                                        size: Get.width * 0.15)))))),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ));
  }
}
