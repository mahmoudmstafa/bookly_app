import 'package:bookly_app/core/routes/app_pages.dart';
import 'package:bookly_app/core/widgets/custom_book_item_image.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/entities/book_entity.dart';
import 'book_details.dart';

class LatestBooksItem extends StatelessWidget {
  const LatestBooksItem({super.key, required this.bookEntity});

  final BookEntity bookEntity;

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
                bookEntity: bookEntity,
                aspectRatio: 70 / 105,
                borderRadius: 8,
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: BookDetails(
                  title: bookEntity.title ?? 'Title UnKnown',
                  auth: bookEntity.auth ?? 'Author UnKnown',
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
      arguments: bookEntity,
    );
  }
}
