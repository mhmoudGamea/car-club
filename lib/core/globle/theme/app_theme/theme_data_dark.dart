import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

ThemeData getThemeDataDark() => ThemeData(
    fontFamily: 'Lexend',
    scaffoldBackgroundColor: primaryDark,
     appBarTheme: const AppBarTheme( 
       iconTheme: IconThemeData(
           color: whiteColor,
       ),
      backgroundColor: primaryDark,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryDark,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
iconTheme: const IconThemeData(
  color: whiteColor,

),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mintGreen,
      unselectedItemColor: greyColo3,


    ),

textTheme:  const TextTheme(
titleMedium:TextStyle(
  fontSize: 20,
fontFamily: 'Lexend' ,
color: whiteColor,
),
    titleSmall: TextStyle(
      fontSize: 15,
      fontFamily: 'Lexend' ,
      color: blue,
    )
),
);
