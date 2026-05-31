import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_best_seller_evaluation.dart';
import '../../../../../core/widgets/custom_book_item_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: CustomBookItemImage(
            aspectRatio: 162 / 243,
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'The Jungle Book',
          style: AppStyles.regular30Roboto(context),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Rudyard Kipling',
          style: AppStyles.montserrat18medium(context),
        ),
        SizedBox(
          height: 19,
        ),
        CustomBestSellerEvaluation(),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
