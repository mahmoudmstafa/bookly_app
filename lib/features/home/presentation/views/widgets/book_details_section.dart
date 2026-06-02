import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../../core/models/book_model.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_best_seller_evaluation.dart';
import '../../../../../core/widgets/custom_book_item_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key, required this.bookModel,
  });

  final BookModel bookModel ;
  @override
  Widget build(BuildContext context) {
    final BookModel bookModel = Get.arguments as BookModel;
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: CustomBookItemImage(
            bookModel: bookModel,
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
          bookModel.title ?? 'Title UnKnown',
          style: AppStyles.regular30Roboto(context),
        ),
        const SizedBox(
          height: 12,
        ),
        AutoSizeText(
          maxLines: 1,
          minFontSize: 16 ,
          overflow: TextOverflow.fade,
          bookModel.auth ?? 'Author UnKnown',
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
