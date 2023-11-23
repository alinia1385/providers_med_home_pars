
import 'package:dio/dio.dart';
import 'package:note_app/core/const/url.dart';

class Api {
  late final Dio dio;

  Dio get client => dio;

  Api() {

    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL ,
        method: "POST",
        // baseUrl: 'http://172.20.1.191:7000',
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        // headers: {
        //   'apiversion': 30,
        //   'appversion': 1,
        // },
      ),
    );


  }
}