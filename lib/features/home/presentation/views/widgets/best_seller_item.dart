import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_app/features/book_details/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/resource.dart';
import 'best_seller_evaluation.dart';
import 'book_details.dart';
import 'image_best_seller.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToBookDetailsView,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: AspectRatio(
          aspectRatio: 307 / 105,
          child: Row(
            children: [
              ImageBestSeller(
                image: AppImages.assetsImagesBook1HightlighPng,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: BookDetails(
                  title: 'Harry Potter and the Goblet of Fire',
                  auth: 'J.K. Rowling',
                  price: '19.99 €',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToBookDetailsView() {
      Get.to(
        BookDetailsView(),
        transition: Transition.zoom,
        duration: kDuration,
      );
    }
}
