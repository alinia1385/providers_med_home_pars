import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/const/url.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/widget/ColorLoader3.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
import 'package:note_app/feature/profile/controller/profile_controller.dart';
import 'package:note_app/feature/profile/screen/wigets/clinic.dart';
import 'package:note_app/feature/profile/screen/wigets/doctor_therapist.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ProfileController.to.stateLoad.value
          ? Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        ProfileController.to.selectProfileImageSend();
                      },
                      child:Obx(()=> ProfileController.to.stateSetProfile.value ? Container(

                        alignment: Alignment.center,
                        width: Get.width * 0.5,
                        height: Get.height,
                        child:
                        ProfileController.to.imageAdress.isEmpty
                            ?
                        const CircleAvatar(
                          backgroundColor: ColorConst.primaryDark,
                          backgroundImage: AssetImage(
                              "assets/images/person_add_icon.png"),
                        )
                            : CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(BASEURLPROFILEIMAGE +
                              ProfileController.to.imageAdress),
                        ),
                      ):const Center(
                          child: Center(
                            child: CircularProgressIndicator(),))),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 25,top: 10),
                        alignment: Alignment.topRight,
                        width: Get.width * 0.11,
                        height: Get.height,
                        child:  Image(
                            image:
                            const AssetImage("assets/images/back.png"),width: Get.width*0.09,height: Get.width*0.09),
                      ),
                    ),
                  ),
                ],
              )),
             Expanded(
              flex: 7,
              child:AppController.to.type.contains("clinic")?  const Clinic() : const DoctorTherapist(),
            ),

            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
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
                        ProfileController.to.setProfile().then((value) {
                      Get.back();

                          FxToast.showToast(
                            context: context,
                            toast:  const ToastWithoutColor.success(
                              message: "اطلاعات با موفقیت ثبت شد",
                              textStyle: TextStyle(
                                  color: Colors.black, fontFamily: "IRANSANCE",fontSize: 18),
                              icon: Icons.info_rounded,
                            ),
                            position: ToastPosition.topRight,
                          );
                        });
                      },
                      child: Container(
                        height: Get.height * 0.07,
                        width: Get.width * 0.45,
                        decoration: const BoxDecoration(
                          color: ColorConst.primaryDark,
                          borderRadius:
                          BorderRadius.all(Radius.circular(50)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "ثبت",
                          style: SizeButton,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        )
      : const Center(child: CircularProgressIndicator())
      ),
    );
  }
}
