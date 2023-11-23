import 'package:note_app/core/const/enum.dart';
import 'package:note_app/core/widget/toast/toast.dart';
import 'package:note_app/core/widget/toast/toast_provider.dart';
import 'package:flutter/material.dart';
Widget toast(
    BuildContext context, ToastProvider toast, ToastPosition? position) {
  return InkWell(
    child: FxToast.show(context, toast),
    onTap: () => FxToast.showToast(
      context: context,
      toast: toast,
      position: position,
    ),
  );
}