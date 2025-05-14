import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/fonts.dart';

class CoinmerceDarkTheme {
  static ThemeData get darkTheme {
    //1
    return ThemeData(
      //2
      primarySwatch: primary,
      primaryColor: primary,
      scaffoldBackgroundColor: solidLightGray,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 4,
        selectedItemColor: strong,
        unselectedItemColor: medium,
      ),
      iconTheme: const IconThemeData(color: mediumWhite),
      cardColor: solidMediumGray,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: white, linearTrackColor: darkGray),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: strong, selectionHandleColor: strong),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          isDense: true,
          fillColor: lightWhite,
          hintStyle: title3White,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          suffixIconColor: mediumWhite,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none)),

      fontFamily: 'GothamSSm',
      package: 'design',
      textTheme: const TextTheme(
        titleLarge: title1White,
        titleMedium: title2White,
        titleSmall: title3White,
        bodyLarge: bodyWhite,
        bodyMedium: inputWhite,
        bodySmall: hintWhite,
        labelLarge: subtitleWhite,
        labelMedium: detailWhite,
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
  MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE3E3E3),
    100: Color(0xFFB8B8B8),
    200: Color(0xFF898989),
    300: Color(0xFF595959),
    400: Color(0xFF363636),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF101010),
    700: Color(0xFF0D0D0D),
    800: Color(0xFF0A0A0A),
    900: Color(0xFF050505),
  });
  static const int _primaryPrimaryValue = 0xFF121212;

  static const MaterialColor primaryAccent =
  MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFFF4E4E),
    200: Color(_primaryAccentValue),
    400: Color(0xFFE70000),
    700: Color(0xFFCE0000),
  });
  static const int _primaryAccentValue = 0xFFFF1B1B;
}
