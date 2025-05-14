import 'package:flutter/material.dart';
import 'package:test_coinmerce/designs/styles/colors.dart';

///Contains all the text styles
///Usable by the theme
///And other widgets in design module
///So it can handle the theme changes
///
///The usage of these properties outside the design module is not recommended
///unless it is really needed

///for material text theme [titleLarge]
const TextStyle title1 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

///for material text theme [titleMedium]
const TextStyle title2 =
TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

///for material text theme [titleSmall]
const TextStyle title3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

///Sequentially for material text theme
///[bodyLarge], [bodyMedium], [bodySmall], [labelLarge], [labelMedium]
const TextStyle body = TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
const TextStyle input = TextStyle(fontSize: 12, fontWeight: FontWeight.w200);
const TextStyle hint = TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
const TextStyle subtitle = TextStyle(fontSize: 10, fontWeight: FontWeight.w300);
const TextStyle detail = TextStyle(fontSize: 8, fontWeight: FontWeight.w300);

//These are text styles for dark theme:
const TextStyle title1White = TextStyle(
  fontSize: 18,
  color: lightGrey,
  fontWeight: FontWeight.w500,
);
const TextStyle title2White = TextStyle(
  fontSize: 16,
  color: lightGrey,
  fontWeight: FontWeight.w400,
);
const TextStyle title3White = TextStyle(
  fontSize: 16,
  color: lightGrey,
  fontWeight: FontWeight.w300,
);
const TextStyle bodyWhite = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: lightGrey,
);
const TextStyle inputWhite = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w200,
  color: lightGrey,
);
const TextStyle hintWhite = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: lightGrey,
);
const TextStyle subtitleWhite = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w300,
  color: lightGrey,
);
const TextStyle detailWhite = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.w300,
  color: lightGrey,
);
