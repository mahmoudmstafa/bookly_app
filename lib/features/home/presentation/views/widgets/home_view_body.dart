import 'package:bookly_app/core/utils/resource.dart';
import 'package:bookly_app/core/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/item_list_view_and_best_seller_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../search_book/presentation/views/search_book_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const String id = 'HomeViewBody';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomAppbar(
            onTapRightIcon: navigateToSearchBookView,
            rightIcon: AppImages.assetsImagesIcSearchSvg,
            leftIcon: AppImages.assetsImagesBOOKLYSvg,
          ),
          Expanded(
            child: ItemListViewAndBestSellerSection(),
          ),
        ],
      ),
    );
  }

  void navigateToSearchBookView() {
    Get.to(
      SearchBookView(),
      transition: Transition.fade,
      duration: kDuration,
    );
  }
}
