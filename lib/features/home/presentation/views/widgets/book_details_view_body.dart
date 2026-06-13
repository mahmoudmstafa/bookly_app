import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/you_can_also_like_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/resource.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../home_view.dart';
import 'book_details_section.dart';
import 'buttons_book_details_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppbar(
              rightIcon: AppImages.assetsImagesGroup2Svg,
              onTapRightIcon: navigateToHomeView,
              leftIcon: AppImages.assetsImagesIcCartSvg,
            ),
            BookDetailsSection(
              bookEntity: bookEntity,
            ),
            const ButtonsBookDetailsView(),
            const YouCanAlsoLikeSection(),
          ],
        ),
      ),
    );
  }

  void navigateToHomeView() {
    Get.to(
      const HomeView(),
      transition: Transition.cupertinoDialog,
      duration: kDuration,
    );
  }
}
