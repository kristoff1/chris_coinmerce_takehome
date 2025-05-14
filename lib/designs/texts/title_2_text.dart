import 'package:flutter/material.dart';

class Title2Text extends Text {
  const Title2Text(super.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      super.data ?? '',
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: super.textAlign,
      overflow: super.overflow,
      textScaleFactor: super.textScaleFactor,
    );
  }
}
