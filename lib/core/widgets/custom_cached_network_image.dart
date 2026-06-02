import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// flutter pub add cached_network_image
class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.errorWidget,
  });

  final String imageUrl;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),

      errorWidget: (context, url, error) =>
          errorWidget ??
          const Icon(
            Icons.image_not_supported,
            color: Colors.white,
          ),
    );
  }
}
