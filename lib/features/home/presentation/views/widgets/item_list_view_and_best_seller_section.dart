import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'best_seller_item_sliver_list.dart';
import 'book_item_list_view.dart';


class ItemListViewAndBestSellerSection extends StatelessWidget {
  const ItemListViewAndBestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ItemListView(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Best Seller',
            style: AppStyles.montserrat20Bold(context),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 22,
          ),
        ),
        BestSellerItemSliverList()
      ],
    );
  }
}
