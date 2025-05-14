import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'const.dart';

///A widget that just wrap the image
///with no additional resizing requirement
///by the parent widget
class DefaultImage extends StatelessWidget {

  final String imagePath;

  const DefaultImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: (_, __) {
        return Image.asset(
          placeholderImagePath,
        );
      },
    );
  }

}