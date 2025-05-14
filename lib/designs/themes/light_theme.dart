import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/fonts.dart';

///The main theme for the app
///with colors suggested by the design workflow
class CoinmerceLightTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      //2
      primarySwatch: primary,
      primaryColor: primary,
      scaffoldBackgroundColor: lightGrey,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: white,
        elevation: 4,
        selectedItemColor: strong,
        unselectedItemColor: medium,
      ),
      iconTheme: const IconThemeData(color: medium),
      cardColor: white,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: strong, linearTrackColor: darkGray),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: strong, selectionHandleColor: strong),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        isDense: true,
        fillColor: fadingLight,
        hintStyle: title3,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        suffixIconColor: strong,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none),
      ),
      fontFamily: 'GothamSSm',
      package: 'design',
      textTheme: const TextTheme(
        titleLarge: title1,
        titleMedium: title2,
        titleSmall: title3,
        bodyLarge: body,
        bodyMedium: input,
        bodySmall: hint,
        labelLarge: subtitle,
        labelMedium: detail,
      ),
    );
  }

  static const MaterialColor dtt = MaterialColor(_dttPrimaryValue, <int, Color>{
    50: Color(0xFFFCEBE8),
    100: Color(0xFFF8CCC6),
    200: Color(0xFFF3AAA0),
    300: Color(0xFFEE887A),
    400: Color(0xFFEA6F5E),
    500: Color(_dttPrimaryValue),
    600: Color(0xFFE34E3B),
    700: Color(0xFFDF4432),
    800: Color(0xFFDB3B2A),
    900: Color(0xFFD52A1C),
  });
  static const int _dttPrimaryValue = 0xFFE65541;

  static const MaterialColor dttAccent =
  MaterialColor(_dttAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_dttAccentValue),
    400: Color(0xFFFFAAA4),
    700: Color(0xFFFF928B),
  });
  static const int _dttAccentValue = 0xFFFFDAD7;

  static const MaterialColor primary =
  MaterialColor(_swatchPrimaryValue, <int, Color>{
    50: Color(0xFFFDFDFD),
    100: Color(0xFFF9F9F9),
    200: Color(0xFFF5F5F5),
    300: Color(0xFFF1F1F1),
    400: Color(0xFFEEEEEE),
    500: Color(_swatchPrimaryValue),
    600: Color(0xFFE9E9E9),
    700: Color(0xFFE5E5E5),
    800: Color(0xFFE2E2E2),
    900: Color(0xFFDDDDDD),
  });
  static const int _swatchPrimaryValue = 0xFFEBEBEB;

  static const MaterialColor swatchAccent =
  MaterialColor(_swatchAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_swatchAccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
  });
  static const int _swatchAccentValue = 0xFFFFFFFF;
}
