import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/widget/ColorLoader3.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
import 'package:note_app/feature/login/controller/login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    flex: 4,
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height,
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.07,
                          vertical: Get.width * 0.07),
                      child: Image.asset("images/logo.png"),
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.15,
                            child: TextFormField(
                              maxLength: 11,
                              controller: LoginController.to.mobile,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(color: Colors.black, fontFamily: "IRANSANCE",fontSize: 16,),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: ColorConst.primaryDark,
                                    ),
                                  ),
                                  hintText: ("شماره همراه"),
                                  hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: ColorConst.primaryDark,
                                      fontFamily: "IRANSANCE"),
                                  suffixIcon: const Icon(
                                    Icons.phone_android,
                                    color: ColorConst.primaryDark,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (LoginController.to.mobile.text.length == 11) {
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
                              LoginController.to.LoginServise().then((value) {
                                Get.back();

                                FxToast.showToast(
                                  context: context,
                                  toast: ToastWithoutColor.success(
                                    message: value.message!,
                                    icon: Icons.info_rounded,
                                  ),
                                  position: ToastPosition.topRight,
                                );

                                if (value.success!) {
                                  Get.toNamed("/Verify");
                                }
                              });
                            } else {
                              FxToast.showToast(
                                context: context,
                                toast: const ToastWithoutColor.success(
                                    message: "لطفا شماره تلفن خود را وارد کنید",
                                    icon: Icons.error,
                                    iconColor: Colors.red),
                                position: ToastPosition.topRight,
                              );
                            }
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
                              "دریافت کد",
                              style: SizeButton,
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ));
  }
}
