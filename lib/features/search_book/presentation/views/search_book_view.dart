import 'package:bookly_app/features/search_book/presentation/views/widgets/search_book_view_body.dart';
import 'package:flutter/material.dart';


class SearchBookView extends StatelessWidget {
  const SearchBookView({super.key});

  static const String id = 'SearchBookView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchBookViewBody(),
    );
  }
}
