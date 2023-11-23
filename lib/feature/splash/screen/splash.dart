import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_app/core/controller/AppController.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController.to.isLandscape_.value = context.isLandscape;
    // TODO: implement build
    return Obx(() => AppController.to.isLandscape_.value
        ? Container(
            alignment: Alignment.center,
            child:Image.asset("assets/images/rotate.png",width: Get.width*0.5,height: Get.height*0.5,),
          )
        : Container());
  }
}
