import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/resource.dart';



class BestSellerEvaluation extends StatelessWidget {
  const BestSellerEvaluation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.assetsImagesStarSvg,
        ),
        SizedBox(
          width:6,
        ),
        Text(
          '4.8',
          style: AppStyles.montserrat16Medium(context),
        ),
        SizedBox(
          width:6,
        ),
        Text(
          '(2390)',
          style: AppStyles.montserrat14Regular(context),
        ),
      ],
    );
  }
}
