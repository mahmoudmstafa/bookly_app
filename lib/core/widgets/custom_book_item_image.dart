import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../entities/book_entity.dart';
import '../routes/app_pages.dart';
import '../utils/constant.dart';
import 'custom_cached_network_image.dart';

class CustomBookItemImage extends StatelessWidget {
  const CustomBookItemImage({
    super.key,
    required this.aspectRatio,
    this.borderRadius,
    this.onTap,
    required this.bookEntity,
  });

  final BookEntity bookEntity;
  final double aspectRatio;

  final double? borderRadius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        navigateToBookDetailsView();
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 16,
          ),
          child: CustomCachedNetworkImage(
            imageUrl: bookEntity.coverImageUrl,
          ),
        ),
      ),
    );
  }

  void navigateToBookDetailsView() {
    Get.toNamed(
      AppPages.details,
      arguments: bookEntity,
    );
  }
}
