import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState {SUCCESS,ERROR,WARNING}

Future<bool?> defaultFlutterToast({
  required String message,
  required ToastState state})
{
  return Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    backgroundColor: chooseToastColor(state),
    textColor: const Color(0xff3EF1BD)
  );
}

Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color = Colors.green;
        break;
    case ToastState.ERROR:
      color = Colors.red;
        break;
    case ToastState.WARNING:
      color = Colors.yellow;
        break;
  }
  return color;
}