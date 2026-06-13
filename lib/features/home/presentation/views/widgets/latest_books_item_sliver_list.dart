import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/entities/book_entity.dart';
import 'latest_books_item.dart';

class LatestBooksItemSliverList extends StatelessWidget {
  const LatestBooksItemSliverList({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return LatestBooksItem(
          bookEntity: books[index],
        );
      },
    );
  }
}
