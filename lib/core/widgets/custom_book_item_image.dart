import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../models/book_model.dart';
import '../routes/app_pages.dart';
import '../utils/constant.dart';
import 'custom_cached_network_image.dart';

class CustomBookItemImage extends StatelessWidget {
  const CustomBookItemImage({
    super.key,
    required this.aspectRatio,
    this.borderRadius,
    // this.onTap,
    required this.bookModel,
  });

  final BookModel bookModel;
  final double aspectRatio;

  final double? borderRadius;

  // final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToBookDetailsView();
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 16,
          ),
          child: CustomCachedNetworkImage(
            imageUrl: bookModel.image ?? kImageUrl,
          ),
        ),
      ),
    );
  }

  void navigateToBookDetailsView() {
    Get.toNamed(
      AppPages.details,
      arguments: bookModel,
    );
  }
}
