import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/resource.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: SvgPicture.asset(
          AppImages.assetsImagesBOOKLYSvg,
        ),
      ),
    );
  }
}
