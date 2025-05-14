import 'package:flutter/material.dart';

class BodyText extends Text {
  const BodyText(super.data, {super.key, super.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      super.data ?? '',
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: super.textAlign,
      overflow: super.overflow,
    );
  }

}