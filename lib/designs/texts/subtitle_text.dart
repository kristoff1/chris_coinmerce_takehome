import 'package:flutter/material.dart';

class SubtitleText extends Text {
  const SubtitleText(super.data, {super.key, super.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      super.data ?? '',
      style: Theme.of(context).textTheme.labelLarge,
      textAlign: textAlign ?? super.textAlign,
      overflow: super.overflow,
      textScaleFactor: super.textScaleFactor,
    );
  }
}
