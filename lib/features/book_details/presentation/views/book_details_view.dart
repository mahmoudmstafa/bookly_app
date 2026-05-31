import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/core/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  static const String id = 'BookDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomAppbar(
              rightIcon: AppImages.assetsImagesGroup2Svg,
              onTapRightIcon: navigateToHomeView,
              leftIcon: AppImages.assetsImagesIcCartSvg,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHomeView() {
    Get.to(
      HomeView(),
      transition: Transition.native,
      duration: kDuration,
    );
  }
}
