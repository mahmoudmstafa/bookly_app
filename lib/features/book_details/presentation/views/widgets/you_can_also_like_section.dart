import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'book_details_list_view_items.dart';


class YouCanAlsoLikeSection extends StatelessWidget {
  const YouCanAlsoLikeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          'You can also like',
          style: AppStyles.montserrat14Semibold(context),
        ),
        SizedBox(
          height: 18,
        ),
        BookDetailsListViewItems(),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
