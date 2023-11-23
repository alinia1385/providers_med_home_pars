import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/controller/theme_controller.dart';
import 'package:note_app/core/controller/translation_controller.dart';


class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Text(
            "Hellow World".tr,
            style: const TextStyle(fontSize: 26.0),
          )),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      endDrawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text("Dark mode:".tr),
                DrawerHeader(
                    curve: Curves.bounceInOut,
                    child: Obx(() => CupertinoSwitch(
                        value: ThemeController.to.Dark.value,
                        onChanged: (Value) {
                          Get.find<ThemeController>().ChangeTheme();
                          if (ThemeController.to.Dark.value) {
                            Get.changeTheme(ThemeData.dark());
                          } else {
                            Get.changeTheme(ThemeData.light());
                          }
                        })),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(onTap: (){
                  TranslationControlller.to.ChangeLanguage('en');
                },
                   child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 100),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[500]),
                      child: const Text(
                        "English",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),


            const Divider(color: Colors.transparent,),


            GestureDetector(onTap: (){
              Get.find<TranslationControlller>().ChangeLanguage('fa');
            },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[500]),
                  child: const Text(
                    "persian",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
            )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
