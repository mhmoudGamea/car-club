import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

ThemeData getThemeDataLight() => ThemeData(
    // font
    fontFamily: 'Lexend',
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor
      ),
      backgroundColor: whiteColor,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: mintGreen,


),
  textTheme: const TextTheme(
      titleMedium:TextStyle(
        fontSize: 23,
        fontFamily: 'Lexend',
        color: blackColor,
      ),
    titleSmall: TextStyle(
    fontSize: 15,
    fontFamily: 'Lexend' ,
    color: blue,
  )
  )

);

