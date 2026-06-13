import 'dart:developer' show log;

import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:hive/hive.dart';

import '../../../../../core/entities/book_entity.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> getLocalGeneralBooks({required int pageNumber}) {
    const int pageSize = 10;
    int startIndex = (pageNumber - 1) * pageSize;

    final books = Hive.box<BookEntity>(
      generalBox,
    ).values.skip(startIndex).take(pageSize).toList();

    return books;
  }

  @override
  List<BookEntity> getLocalLatestBooks({required int pageNumber}) {
    const int pageSize = 10;
    int startIndex = (pageNumber - 1) * pageSize;
    var books = Hive.box<BookEntity>(latestBooks).values.skip(startIndex).take(pageSize).toList();

    return books;
  }

  @override
  List<BookEntity> getYouCanAlsoLikeBooks() {
    var localBooks = Hive.box<BookEntity>(youCanAlsoLike).values.toList();

    return localBooks;
  }
}
