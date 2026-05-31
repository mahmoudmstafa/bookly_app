import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_book_item_image.dart';


class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * .5,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: CustomBookItemImage(
                aspectRatio: 130 / 193,
              ),
            );
          },
        ),
      ),
    );
  }
}
