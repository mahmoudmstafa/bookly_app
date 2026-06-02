import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_app/core/routes/app_pages.dart';
import 'package:bookly_app/core/widgets/custom_book_item_image.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/models/book_model.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/resource.dart';
import '../../../../../core/widgets/custom_best_seller_evaluation.dart';
import 'book_details.dart';

class LatestBooksItem extends StatelessWidget {
  const LatestBooksItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToBookDetailsView,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: AspectRatio(
          aspectRatio: 307 / 105,
          child: Row(
            children: [
              CustomBookItemImage(
                bookModel: bookModel,
                aspectRatio: 70 / 105,
                borderRadius: 8,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: BookDetails(
                  title: bookModel.title ?? 'Title UnKnown',
                  auth: bookModel.auth ?? 'Author UnKnown',
                  price: 'FREE',
                ),
              ),
            ],
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
