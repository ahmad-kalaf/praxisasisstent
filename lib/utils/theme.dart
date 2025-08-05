import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kAppBarBackgroundColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.grey,
  appBarTheme: AppBarTheme(
    backgroundColor: kAppBarBackgroundColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: kDefaultAppBarFontSize,
      color: kDefaultTextColor,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: kDefaultTextColor),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: kDefaultBodyFontSize,
      color: kDefaultTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: kDefaultAppBarFontSize,
      color: kDefaultTextColor,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    floatingLabelAlignment: FloatingLabelAlignment.center,
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 2,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kAppBarBackgroundColor,
      foregroundColor: kDefaultTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),
);
