import 'package:flutter/material.dart';
import '../../../../../core/models/book_model.dart';
import 'latest_books_item.dart';

class LatestBooksItemSliverList extends StatelessWidget {
  const LatestBooksItemSliverList({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return LatestBooksItem(
          bookModel: books[index],
        );
      },
    );
  }
}
