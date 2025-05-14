import 'package:flutter/material.dart';

import 'default_image.dart';

/// A Hero transitionable image widget
/// This one is in the list item widget
class CoinImage extends StatelessWidget {
  final String id;
  final String imagePath;

  const CoinImage({
    super.key,
    required this.id,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: DefaultImage(
        imagePath: imagePath,
      ),
    );
  }
}