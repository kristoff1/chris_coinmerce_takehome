import 'package:flutter/material.dart';

import '../styles/colors.dart';

///Splash screen widget
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGray,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/icons/coinmerce-logo.webp',
      ),
    );
  }
}
