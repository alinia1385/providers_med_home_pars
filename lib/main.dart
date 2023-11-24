import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/bidings/bidings.dart';
import 'package:note_app/core/routs/routs.dart';
import 'package:note_app/core/tranlate.dart';
import 'package:note_app/feature/home_visit/home_visit_init.dart';
import 'package:note_app/feature/home_visit/screen/visit_home.dart';
import 'package:note_app/feature/login/login_init.dart';
import 'package:note_app/feature/login/screen/login.dart';
import 'package:note_app/feature/patients_info/screen/patients_info.dart';
import 'package:note_app/feature/patients_list/patients_list_init.dart';
import 'package:note_app/feature/patients_list/screen/patients_list.dart';
import 'package:note_app/feature/patients_location/map_init.dart';
import 'package:note_app/feature/patients_location/screen/patients_location.dart';
import 'package:note_app/feature/patients_request/patients_list_init.dart';
import 'package:note_app/feature/patients_request/screen/patients_request.dart';
import 'package:note_app/feature/profile/profile_init.dart';
import 'package:note_app/feature/profile/screen/profile.dart';



import 'package:note_app/feature/splash/screen/splash.dart';
import 'package:note_app/feature/splash/splash_init.dart';
import 'package:note_app/feature/login/screen/verify.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translate(),
      debugShowCheckedModeBanner: false,
      initialBinding: MyBiding(),
      initialRoute: "/",
      // getPages: Routes.Pages,
      // initialRoute: "/Login",
      getPages: [
        GetPage(name: "/", page: ()=>Splash(),binding: SplashInit()),
        GetPage(name: "/Login", page: ()=>Login(),binding: LoginInit()),
        GetPage(name: "/Verify", page: ()=>Verify()),
        GetPage(name: "/Profile", page: ()=>Profile(),binding: ProfileInit()),
        GetPage(name: "/VisitHome", page: ()=>VisitHome(),binding: HomeVisitInit()),
        GetPage(name: "/PatientsList", page: ()=>PatientsList(),binding: PatientsListInit()),
        GetPage(name: "/PatientsRequest", page: ()=>PatientsRequest(),binding: PatientsRequestInit()),
        GetPage(name: "/PatientsInfo", page: ()=>PatientsInfo()),
        GetPage(name: "/patients_location", page: ()=>patients_location(),binding: MapInit()),
      ],
    );
  }
}
