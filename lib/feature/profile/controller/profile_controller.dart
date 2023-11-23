import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/profile/data/model/ModelProfile.dart';
import 'package:note_app/feature/profile/data/model/profile_form_data.dart';
import 'package:note_app/feature/profile/data/remote/profile_remote.dart';
import 'package:note_app/feature/profile/screen/profile.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();

  // late VideoPlayerController videoPlayerController;

  // RxBool isLoadVideo = false.obs;
  final FocusNode fName = FocusNode();
  final FocusNode fFamily = FocusNode();
  final FocusNode fNationalCode = FocusNode();
  final FocusNode fAge = FocusNode();

  final tName = TextEditingController();
  final tFamily = TextEditingController();
  final tNationalCode = TextEditingController();
  final tAge = TextEditingController();

  bool gender = false;

  ModelProfile mProfile = ModelProfile();

  ///false is man - true is woman

  String imageAdress = "";

  RxBool man=false.obs;
  RxBool woman=false.obs;

   selectProfileImageSend()async
   {
     FilePickerResult? result = await FilePicker.platform.pickFiles( type: FileType.image,allowMultiple: false);

     if (result != null) {
       final fileBytes = result.files.first.bytes;
       ProfileRemoteDatasource.setProfileImage(base64.encode(fileBytes!),result.files.first.name);


       // print(result.files.single.path!);
       // File file = File(result.files.single.path!);
       // ProfileRemoteDatasource.setProfileImage(result.files.single.path!);
     } else {
       // User canceled the picker
     }
   }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    //videoPlayerController.dispose();
  }

  final ProfileRemote ProfileRemoteDatasource = ProfileRemote();
  //dio.options.headers["Authorization"] = "Bearer $token";

  RxBool stateLoad = false.obs;
  Future<void> getProfile() async {
    stateLoad.value = false;
    final baseListDaynamic  = await ProfileRemoteDatasource.getProfile();
    mProfile=ModelProfile.fromJson(baseListDaynamic.data!);
    await getValue();
    stateLoad.value = true;
  }


  RxBool stateSetProfile = false.obs;
  Future<BaseListDaynamicStandard> setProfile() async {
    stateSetProfile.value = false;
    setValue();
    final baseListDaynamic  = await ProfileRemoteDatasource.setProfile(setValue());

    stateSetProfile.value = true;
    return baseListDaynamic;
  }

  getValue() {
    tName.text = mProfile.name.toString();
    tFamily.text = mProfile.surname.toString();
    tAge.text = mProfile.age.toString();
    tNationalCode.text = mProfile.nationalCode.toString();
    imageAdress = mProfile.image.toString();
    if (mProfile.sex == 0) {
      man.value = true;
    } else {
      woman.value = true;
    }
  }

  ModelProfileFormData setValue() {
    ModelProfileFormData mProfile=ModelProfileFormData();
    mProfile.name=tName.text;
    mProfile.surname=tFamily.text;
    mProfile.age=tAge.text;
    mProfile.nationalCode=tNationalCode.text;
    if(man.value)
      {
        mProfile.sex=0;
      }else
        {
          mProfile.sex=1;
        }
    return mProfile;
  }
}
