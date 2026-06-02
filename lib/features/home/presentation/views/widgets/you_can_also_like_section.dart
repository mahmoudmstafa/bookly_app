import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'you_can_also_list_view.dart';


class YouCanAlsoLikeSection extends StatelessWidget {
  const YouCanAlsoLikeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          'You can also like',
          style: AppStyles.montserrat14Semibold(context),
        ),
        const SizedBox(
          height: 18,
        ),
        const YouCanAlsoLikeListView(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
