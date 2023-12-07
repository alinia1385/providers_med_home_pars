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
import 'package:note_app/feature/login/controller/timer_controller.dart';

class Verify extends StatelessWidget {
  final TimerController timerController = Get.put(TimerController());

  Verify({super.key});

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
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 75),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "کد تایید",
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorConst.primaryDark,
                            fontFamily: "IRANSANCE"),
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                        focusNode: LoginController
                                            .to.firstTextFieldFocusNode,
                                        controller: LoginController.to.Txt1,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          if (value.length == 1) {
                                            FocusScope.of(context).requestFocus(
                                                LoginController.to
                                                    .secondTextFieldFocusNode);
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: ColorConst.primaryDark),
                                          ),
                                        )))
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                        focusNode: LoginController
                                            .to.secondTextFieldFocusNode,
                                        controller: LoginController.to.Txt2,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          if (value.isEmpty) {
                                            FocusScope.of(context).requestFocus(
                                                LoginController.to
                                                    .firstTextFieldFocusNode);
                                          } else if (value.length == 1) {
                                            FocusScope.of(context).requestFocus(
                                                LoginController.to
                                                    .thirdTextFieldFocusNode);
                                          }
                                        },
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: ColorConst.primaryDark),
                                          ),
                                        )))
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                        focusNode: LoginController
                                            .to.thirdTextFieldFocusNode,
                                        controller: LoginController.to.Txt3,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          if (value.isEmpty) {
                                            FocusScope.of(context).requestFocus(
                                                LoginController.to
                                                    .secondTextFieldFocusNode);
                                          } else if (value.length == 1) {
                                            FocusScope.of(context).requestFocus(
                                                LoginController.to
                                                    .fourthTextFieldFocusNode);
                                          }
                                        },
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: ColorConst.primaryDark),
                                          ),
                                        )))
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 40,
                                    child: TextFormField(
                                        focusNode: LoginController
                                            .to.fourthTextFieldFocusNode,
                                        controller: LoginController.to.Txt4,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          if (value.isEmpty) {
                                            FocusScope.of(context).requestFocus(
                                                LoginController.to
                                                    .thirdTextFieldFocusNode);
                                          }
                                        },
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                width: 1,
                                                color: ColorConst.primaryDark),
                                          ),
                                        )))
                              ],
                            )),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child:  Obx(() {
                      final countdown = timerController.countdown.value;
                      int remainingSeconds = timerController.countdown.value;
                      String timerText =
                          '${(remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}';

                      if (countdown > 0) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                            ' تا امکان ارسال مجدد کد ',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              ' $timerText ' ,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Icon(Icons.access_time,),
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            timerController.showWidget();

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

                            LoginController.to.reSendServise().then((value){
                              Get.back();
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ارسال مجدد کد',style: TextStyle(fontSize: 14,color: ColorConst.primaryDark),),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            bool anyTextFieldIsEmpty = LoginController.to.Txt1.text.isEmpty ||
                                LoginController.to.Txt2.text.isEmpty ||
                                LoginController.to.Txt3.text.isEmpty ||
                                LoginController.to.Txt4.text.isEmpty;

                            if (anyTextFieldIsEmpty) {
                              FxToast.showToast(
                                context: context,
                                toast: const ToastWithoutColor.success(
                                    message: "لطفا کد تایید را وارد نمایید",
                                    icon: Icons.error,
                                    iconColor: Colors.red),
                                position: ToastPosition.topRight,
                              );
                            } else {
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
                              LoginController.to
                                  .LoginServiseSetCode()
                                  .then((value) {
                                Get.back();

                                if (value.success!) {
                                  Get.offAllNamed("/VisitHome");
                                  FxToast.showToast(
                                    context: context,
                                    toast: ToastWithoutColor.success(
                                      message: "خوش آمدید",
                                      icon: Icons.info_rounded,
                                    ),
                                    position: ToastPosition.topRight,
                                  );
                                }else{
                                  FxToast.showToast(
                                    context: context,
                                    toast: const ToastWithoutColor.error(
                                        message: "کد وارد شده صحیح نیست.",
                                        icon: Icons.error,
                                        iconColor: Colors.red
                                    ),
                                    position: ToastPosition.topRight,
                                  );
                                }
                              });
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
                              "ورود",
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
