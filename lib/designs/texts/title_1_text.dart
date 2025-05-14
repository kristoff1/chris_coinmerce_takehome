import 'package:flutter/material.dart';

class Title1Text extends Text {
  const Title1Text(super.data, {super.key, super.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      super.data ?? '',
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: textAlign ?? super.textAlign,
      overflow: super.overflow,
    );
  }
}
