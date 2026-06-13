import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_best_seller_evaluation.dart';
import '../../../../../core/widgets/custom_book_item_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key, required this.bookEntity,
  });

  final BookEntity bookEntity ;
  @override
  Widget build(BuildContext context) {
    final BookEntity bookEntity = Get.arguments as BookEntity;
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: CustomBookItemImage(
            bookEntity: bookEntity,
            aspectRatio: 162 / 243,
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        AutoSizeText(
          maxLines: 1,
          minFontSize: 25 ,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
          bookEntity.title ?? 'Title UnKnown',
          style: AppStyles.regular30Roboto(context),
        ),
        const SizedBox(
          height: 12,
        ),
        AutoSizeText(
          maxLines: 1,
          minFontSize: 16 ,
          overflow: TextOverflow.fade,
          bookEntity.auth ?? 'Author UnKnown',
          textAlign: TextAlign.center,
          style: AppStyles.montserrat18medium(context),
        ),
        const SizedBox(
          height: 19,
        ),
        const CustomBestSellerEvaluation(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
