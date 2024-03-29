import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';

Widget defaultButton({required Widget buttonName, required Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Container(
      height: 50,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: mintGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: buttonName,
      ),
    ),
  );
}
