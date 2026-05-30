import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/resource.dart';


class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 14 / 1,
      child: SvgPicture.asset(
        AppImages.assetsImagesBOOKLYSvg,
      ),
    );
  }
}
