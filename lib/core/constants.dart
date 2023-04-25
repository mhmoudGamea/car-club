import 'package:flutter/material.dart';

dynamic uId;
dynamic email;
dynamic remember;
const primaryDark = Color(0xff171820);
const secondaryDark = Color(0xff282A3E);
const textButtonColor = Color(0xff171820);
const secondaryLoginColor = Color(0xff3EF1BD);

ThemeData lightTheme = ThemeData(
  fontFamily: 'Lexend',
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    // titleSpacing: 20,
    backgroundColor: Colors.white,
    // elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mintGreen,
    secondary: babyBlue,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Lexend',
  scaffoldBackgroundColor: primaryDark,
);

const textButtonStyle = TextStyle(
  color: whiteColor,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

/// *********************************************
// default
const Color greyColor = Color(0xffc8d6e5);
// less darkness
const Color greyColor2 = Color.fromARGB(255, 229, 234, 240);
// most darkness
const Color greyColo3 = Color.fromARGB(255, 173, 183, 194);

/// *********************************************
const Color mintGreen = Color(0xff3EF1BD);
const Color babyBlue = Color(0xff0abde3);
const Color whiteColor = Color(0xffffffff);
const Color blackColor = Color(0xff000000);
