import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/const/url.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
import 'package:note_app/feature/profile/controller/profile_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Obx(() =>
        ProfileController.to.stateLoad.value
            ?
        Column(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ProfileController.to.selectProfileImageSend();
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 140),
                          alignment: Alignment.center,
                          width: 125,
                          height: Get.height,
                          child:
                          ProfileController.to.imageAdress.isEmpty
                          ?
                          const CircleAvatar(
                            radius: 100,
                            backgroundColor: ColorConst.primaryDark,
                            backgroundImage: AssetImage(
                                "assets/images/person_add_icon.png"),
                          )
                        : CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(BASEURLPROFILEIMAGE +
                                ProfileController.to.imageAdress),
                          ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // ProfileController.to.setProfile().then((value) {
                        //   FxToast.showToast(
                        //     context: context,
                        //     toast: ToastWithoutColor.success(
                        //       message: value.message!,
                        //       icon: Icons.info_rounded,
                        //     ),
                        //     position: ToastPosition.topRight,
                        //   );
                        //
                        // });
                        Get.toNamed("/VisitHome");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, left: 50),
                        alignment: Alignment.topLeft,
                        width: 25,
                        height: Get.height,
                        child: const Image(
                            image: AssetImage("assets/images/back.png")),
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        // controller: ProfileController.to.tName,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 1, color: ColorConst.primaryDark),
                          ),
                          hintText: (":نام"),
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: ColorConst.primaryDark,
                              fontFamily: "IRANSANCE"),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      // controller: ProfileController.to.tFamily,
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              width: 1, color: ColorConst.primaryDark),
                        ),
                        hintText: (":نام خانوادگی"),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            color: ColorConst.primaryDark,
                            fontFamily: "IRANSANCE"),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        // controller: ProfileController.to.tNationalCode,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 1, color: ColorConst.primaryDark),
                          ),
                          hintText: (":کدملی"),
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: ColorConst.primaryDark,
                              fontFamily: "IRANSANCE"),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        // controller: ProfileController.to.tNationalCode,
                        maxLength: 50,
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 1, color: ColorConst.primaryDark),
                          ),
                          hintText: (":تخصص"),
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: ColorConst.primaryDark,
                              fontFamily: "IRANSANCE"),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        // controller: ProfileController.to.tAge,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 1, color: ColorConst.primaryDark),
                          ),
                          hintText: (":سن"),
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: ColorConst.primaryDark,
                              fontFamily: "IRANSANCE"),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: ColorConst.primaryDark,
                            onChanged: (value) {
                              // ProfileController.to.woman.value = true;
                              // if (value!) {
                              //   ProfileController.to.man.value = false;
                              // }
                            },
                            value: isBlank,
                            // ProfileController.to.woman.value,
                            side: const BorderSide(
                              color: ColorConst.primaryDark,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const Text("خانم",
                              style: TextStyle(
                                  fontFamily: "IRANSANCE", fontSize: 14))
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: ColorConst.primaryDark,
                              onChanged: (value) {
                                // ProfileController.to.man.value = true;
                                // if (value!) {
                                //   ProfileController.to.woman.value = false;
                                // }
                              },
                              value: isBlank,
                              // ProfileController.to.man.value,
                              side: const BorderSide(
                                color: ColorConst.primaryDark,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const Text(
                              "آقا",
                              style: TextStyle(
                                  fontFamily: "IRANSANCE", fontSize: 14),
                            )
                          ],
                        )),
                    const Expanded(
                      child: Text(":جنسیت",
                          style: TextStyle(
                              fontFamily: "IRANSANCE", fontSize: 16)),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ProfileController.to.setProfile().then((value) {
                          FxToast.showToast(
                            context: context,
                            toast: ToastWithoutColor.success(
                              message: value.message!,
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
