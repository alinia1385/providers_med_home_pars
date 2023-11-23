import 'package:flutter/foundation.dart';

import 'client/dio_client.dart';
import 'package:dio/dio.dart';

class App {

  static late Dio client;
  static Uri? uriThatAppOpenWith;

  static init() async {

    client = Api().client;
  }
}