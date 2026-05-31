import 'package:bookly_app/core/utils/resource.dart';
import 'package:bookly_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const String id = 'HomeViewBody';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height:50,
          ),
          CustomAppbar(
            rightIcon: AppImages.assetsImagesBOOKLYSvg,
            leftIcon: AppImages.assetsImagesIcSearchSvg,
          ),
        ],
      ),
    );
  }
}