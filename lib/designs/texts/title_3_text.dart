import 'package:flutter/material.dart';

class Title3Text extends Text {
  const Title3Text(super.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      super.data ?? '',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: super.textAlign,
      overflow: super.overflow,
      textScaleFactor: super.textScaleFactor,
    );
  }
}
