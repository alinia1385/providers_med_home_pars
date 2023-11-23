// // import 'package:e_reza/feacher/bank/controller/bank_controller.dart';
// import 'package:get/get.dart';
//
// import 'dart:html';
// import 'package:flutter/scheduler.dart';
//
// class RedirectionHelper {
//   redirect() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       /*  if (window.location.href.contains('?')) {
//         List<String> parameters = window.location.href.split('?')[1].split('&');
//         String pageName = parameters[0].split('=')[1];
//         String key = parameters[1].split('=')[1];
//         switch (pageName) {
//           case 'paymentResult':
//             BoxHelper.setToken(key);
//             BoxHelper.setRegistered(true);
//             Get.toNamed(RoutePath.paymentResult);
//         }
//       }
//     });*/
//
//       Uri uri = Uri.parse(window.location.href);
//       // print(uri);
//       // print(uri.runtimeType);
//       // print(uri.queryParametersAll.length);
//       if (uri.queryParameters['redirectPage'] != null) {
//         // print(uri.queryParameters['orderId']);
//         String data = uri.queryParameters['redirectPage']!;
//
//
//         switch (data) {
//           case "paymentResult":
//         BankController.to.getPaymentResult(uri.queryParameters["orderId"]!);
//            break;
//
//           case "payment":
//             BankController.to.stateForm.value=0;
//             BankController.to.tabSelect.value = 0;
//             break;
//
//           case "donate":
//             BankController.to.stateForm.value=0;
//             BankController.to.tabSelect.value = 2;
//             break;
//
//           case "volunteer":
//             BankController.to.stateForm.value=0;
//             BankController.to.tabSelect.value = 1;
//             break;
//           default:
//             BankController.to.stateForm.value=0;
//             BankController.to.tabSelect.value = 0;
//
//         }
//
//       } else {
//         BankController.to.stateForm.value=0;
//
//       }
//     });
//   }
//
//
// }
