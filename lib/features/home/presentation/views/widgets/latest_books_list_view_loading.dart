

import 'package:flutter/material.dart';

import 'custom_book_item_image_loading.dart';


class LatestBooksListViewLoading extends StatelessWidget {
  const LatestBooksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, _) => const SizedBox(
        width: 8,
      ),
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount:10,
      itemBuilder: (context, index) {
        return const CustomBookItemImageLoading();
      },
    );
  }
}
