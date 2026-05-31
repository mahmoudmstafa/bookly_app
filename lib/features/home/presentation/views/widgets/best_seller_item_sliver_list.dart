import 'package:flutter/material.dart';

import 'best_seller_item.dart';

class BestSellerItemSliverList extends StatelessWidget {
  const BestSellerItemSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return BestSellerItem();
      },
    );
  }
}
