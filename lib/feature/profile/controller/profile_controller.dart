import 'dart:async';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_app/core/controller/AppController.dart';
import 'package:note_app/core/model/base_list_daynamic_standard.dart';
import 'package:note_app/feature/profile/data/model/ModelProfile.dart';
import 'package:note_app/feature/profile/data/remote/profile_remote.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();

  //doctor  herapist
  final FocusNode fName = FocusNode();
  final FocusNode fFamily = FocusNode();
  final FocusNode fNationalCode = FocusNode();
  final FocusNode fAge = FocusNode();

  final tName = TextEditingController();
  final tFamily = TextEditingController();
  final tMsn = TextEditingController();
  final tSpecialty = TextEditingController();
  final tAge = TextEditingController();
  final tMobile = TextEditingController();
  final tAddress = TextEditingController();
  final tPhone1 = TextEditingController();
  final tPhone2 = TextEditingController();

  //clinic
  final tcName = TextEditingController();
  final tcPhone1 = TextEditingController();
  final tcPhone2 = TextEditingController();
  final tcAddress = TextEditingController();
  final tcOwnerName = TextEditingController();
  final tcOwnerSurname = TextEditingController();
  final tcOwnerMobile = TextEditingController();
  final tcOwnerDesc = TextEditingController();

  bool gender = false;

  ModelProfile mProfile = ModelProfile();

  ///false is man - true is woman



  RxBool man = false.obs;
  RxBool woman = false.obs;
  String imageAdress = "";
  selectProfileImageSend() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null) {
      stateSetProfile.value = false;
      final fileBytes = result.files.first.bytes;
      final baseListDaynamic = await ProfileRemoteDatasource.setProfileImage(
          base64.encode(fileBytes!), result.files.first.name);

      if (baseListDaynamic.success!) {
        imageAdress = baseListDaynamic.data!["file"].toString();
      }

      // print(result.files.single.path!);
      // File file = File(result.files.single.path!);
      // ProfileRemoteDatasource.setProfileImage(result.files.single.path!);
    } else {
      // User canceled the picker
    }
    stateSetProfile.value = true;
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
    final baseListDaynamic = await ProfileRemoteDatasource.getProfile();
    mProfile = ModelProfile.fromJson(baseListDaynamic.data!);
    AppController.to.type.contains(mProfile.type.toString())
        ? setValueClinic()
        : setValueDoctorTherapist();
    stateLoad.value = true;
  }

  RxBool stateSetProfile = true.obs;

  Future<BaseListDaynamicStandard> setProfile() async {
    stateSetProfile.value = false;
    AppController.to.type.contains("clinic")
        ? getValueClinic()
        : getValueDoctorTherapist();
    final baseListDaynamic = await ProfileRemoteDatasource.setProfile(mProfile);
    stateSetProfile.value = true;
    return baseListDaynamic;
  }

  setValueClinic() {
    tcName.text = mProfile.name.toString();
    tcPhone1.text = mProfile.phone1.toString();
    tcPhone2.text = mProfile.phone2.toString();
    tcOwnerName.text = mProfile.owner_name.toString();
    tcOwnerSurname.text = mProfile.owner_surname.toString();
    tcOwnerMobile.text = mProfile.owner_mobile.toString();
    tcOwnerDesc.text = mProfile.description.toString();
    tcAddress.text = mProfile.address.toString();
    imageAdress = mProfile.image.toString();
  }

  setValueDoctorTherapist() {
    tName.text = mProfile.name.toString();
    tFamily.text = mProfile.surname.toString();
    tMsn.text = mProfile.msn.toString();
    tAddress.text = mProfile.address.toString();
    tSpecialty.text = mProfile.specialty.toString();
    tAge.text = mProfile.age.toString();
    tMobile.text = mProfile.mobile.toString();
    tPhone1.text = mProfile.phone1.toString();
    tPhone2.text = mProfile.phone2.toString();
    imageAdress = mProfile.image.toString();

    if (mProfile.sex == 0) {
      man.value = true;
    } else {
      woman.value = true;
    }
  }

  getValueClinic() {
    mProfile.name = tcName.text;

    mProfile.phone1 = tcPhone1.text;
    mProfile.phone2 = tcPhone2.text;
    mProfile.owner_name = tcOwnerName.text;
    mProfile.owner_surname = tcOwnerSurname.text;
    mProfile.owner_mobile = tcOwnerMobile.text;
    mProfile.description = tcOwnerDesc.text;
    mProfile.address = tcAddress.text;
  }

  getValueDoctorTherapist() {
    mProfile.name = tName.text;
    mProfile.surname = tFamily.text;
    mProfile.msn = int.parse(tMsn.text);
    mProfile.address = tAddress.text;
    mProfile.specialty = tSpecialty.text;
    mProfile.age = int.parse(tAge.text);
    mProfile.mobile = tMobile.text;


    // ignore: unrelated_type_equality_checks
    if (man.value) {
      mProfile.sex = 0;
    } else {
      mProfile.sex = 1;
    }
  }
}
