import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';

Widget defaultButton({required String buttonName, required Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Container(
      height: 50,
     width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: secondaryLoginColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          buttonName,
          style: textButtonStyle,
        ),
      ),
    ),
  );
}
