import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const title12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    color: Color(0xff9C99AD),
  );
  static const title13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Color(0xff9C99AD),
  );
  static const title14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff9C99AD),
  );
  static const title15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xffB7DFFF),
  );
  static const title16 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: textButtonColor,
  );
  static const titleSmall = TextStyle(
    fontSize: 15,
    color: textButtonColor,
  );
////////////
  static const titleLarge = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: textButtonColor,
  );
  static const titleLargest = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 40,

  );

  static const titleMedium = TextStyle(
    fontSize: 15,
    color: textButtonColor,
  );

  static const authCustomTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: textButtonColor,
  );
}
