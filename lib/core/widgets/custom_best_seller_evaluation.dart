import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_styles.dart';
import '../utils/resource.dart';



class CustomBestSellerEvaluation extends StatelessWidget {
  const CustomBestSellerEvaluation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.assetsImagesStarSvg,
        ),
        const SizedBox(
          width:6,
        ),
        Text(
          '4.8',
          style: AppStyles.montserrat16Medium(context),
        ),
        const SizedBox(
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
