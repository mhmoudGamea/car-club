import 'package:flutter/material.dart';

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
}
