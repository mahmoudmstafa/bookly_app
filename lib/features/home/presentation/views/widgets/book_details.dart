import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_best_seller_evaluation.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.title,
    required this.auth,
    required this.price,
  });

  final String title, auth, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AutoSizeText(
          title,
          maxLines: 1,
          minFontSize: 16,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.montserrat20Regular(
            context,
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          minFontSize: 14,
          overflow: TextOverflow.ellipsis,
          auth,
          style: AppStyles.montserrat14Medium(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                price,
                style: AppStyles.montserrat18Semibold(context),
              ),
            ),
            CustomBestSellerEvaluation(),
          ],
        ),
      ],
    );
  }
}
