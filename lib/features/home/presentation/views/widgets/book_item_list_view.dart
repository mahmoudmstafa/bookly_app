import 'dart:developer';

import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../core/widgets/custom_book_item_image.dart';

class ItemListView extends StatelessWidget {

  const ItemListView({
    super.key,
    required this.books, required this.controller,
  });
  final List<BookEntity> books;
  final ScrollController controller ;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      separatorBuilder: (_, _) => const SizedBox(
        width: 8,
      ),
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return CustomBookItemImage(
          bookEntity: books[index],
          aspectRatio: 130 / 193,
        );
      },
    );
  }

}
