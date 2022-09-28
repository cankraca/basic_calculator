import 'package:flutter/material.dart';
import 'color_constants.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      headline3: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: ColorConstants.darkPrimaryColor,
    scaffoldBackgroundColor: ColorConstants.darkScaffoldBackgroundColor,
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        backgroundColor: ColorConstants.darkButtonColor,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      headline3: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: ColorConstants.lightPrimaryColor,
    scaffoldBackgroundColor: ColorConstants.lightScaffoldBackgroundColor,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        elevation: 0,
        backgroundColor: ColorConstants.lightButtonColor,
        foregroundColor: Colors.black,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
