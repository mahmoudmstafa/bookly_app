import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_book_item_image.dart';
import '../../../../book_details/presentation/views/book_details_view.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .28,
        child: ListView.separated(
          separatorBuilder: (_, _) => SizedBox(
            width: 5,
          ),
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustomBookItemImage(
              onTap: () {
                navigateToBookDetailsView();
              },
              aspectRatio: 130 / 193,
            );
          },
        ),
      ),
    );
  }

  void navigateToBookDetailsView() {
    Get.to(
      BookDetailsView(),
      transition: Transition.zoom,
      duration: kDuration,
    );
  }
}
