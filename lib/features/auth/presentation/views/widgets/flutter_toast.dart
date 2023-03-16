import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { success, error, warning }

Future<bool?> defaultFlutterToast(
    {required String message, required ToastState state}) {
  return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16,
      backgroundColor: chooseToastColor(state),
      textColor: const Color(0xff3EF1BD));
}

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}
