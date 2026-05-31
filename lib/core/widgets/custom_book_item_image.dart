import 'package:flutter/material.dart';

import '../utils/resource.dart';

class CustomBookItemImage extends StatelessWidget {
  const CustomBookItemImage({
    super.key,
    required this.aspectRatio,
    this.borderRadius,
  });

  final double aspectRatio;

  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 16,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.assetsImagesBook1HightlighPng,
            ),
          ),
        ),
      ),
    );
  }
}
