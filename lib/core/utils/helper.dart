import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'styles.dart';

class Helper {
  static AppBar normalAppBar({
    required BuildContext context,
    required String title,
    required Color backgroundColor,
    double? elevation,
    Color? color,
    double? fontSize,
    double? iconSize,
  }) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          size: iconSize ?? 22,
          color: color ?? Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        title,
        style: Styles.title16.copyWith(color: color, fontSize: fontSize ?? 16),
      ),
      backgroundColor: backgroundColor,
      elevation: elevation ?? 0,
    );
  }

  static void showCustomToast(
      {required BuildContext context,
      required Color bgColor,
      required IconData icon,
      required String msg}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: bgColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 10),
            Text(
              msg,
              style: Styles.title14.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      fadeDuration: const Duration(milliseconds: 500),
      gravity: ToastGravity.BOTTOM,
    );
  }
}
