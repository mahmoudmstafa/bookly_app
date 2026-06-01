import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_book_item_image.dart';


class BookDetailsListViewItems extends StatelessWidget {
  const BookDetailsListViewItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .2,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          return CustomBookItemImage(
            borderRadius: 8,
            aspectRatio: 70 / 112,
          );
        },
      ),
    );
  }
}
