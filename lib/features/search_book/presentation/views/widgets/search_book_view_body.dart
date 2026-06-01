import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/resource.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../home/presentation/views/widgets/best_seller_item_sliver_list.dart';
import 'custom_text_form_field.dart';

class SearchBookViewBody extends StatelessWidget {
  const SearchBookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            onTapRightIcon: navigateToHomeView,
            leftIcon: AppImages.assetsImagesBOOKLYSvg,
            rightIcon: AppImages.assetsImagesGroup2Svg,
          ),
          CustomTextFormField(
            hintText: 'Search',
            enabledBorderColor: Colors.white,
            focusedBorderColor: Colors.white,
          ),
          SizedBox(
            height:40,
          ),
          Text(
            'Get Another Books',
            style: AppStyles.montserrat20Bold(context),
          ),
          SizedBox(
            height: 22,
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                BestSellerItemSliverList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToHomeView() {
    Get.to(
      HomeView(),
      transition: Transition.cupertinoDialog,
      duration: kDuration,
    );
  }
}
