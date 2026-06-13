import 'dart:developer' show log;

import 'package:bookly_app/core/service/api_service.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:hive/hive.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/func/save_local_data.dart';
import '../../../../../core/models/book_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchGeneralBooks({required int pageNumber}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'q=general&limit=10&page=$pageNumber',
    );
    List<BookEntity> books = getBooks(data);
    await saveData(
      books: books,
      boxName: generalBox,
    );
    return books;
  }

  @override
  Future<List<BookEntity>> fetchLatestBooks({required int pageNumber}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'q=history&limit=10&page=$pageNumber',
    );
    List<BookEntity> books = getBooks(data);
    await saveData(
      books: books,
      boxName: latestBooks,
    );
    return books;
  }

  @override
  Future<List<BookEntity>> fetchYouCanAlsoLikeBooks() async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'q=history',
    );
    List<BookEntity> books = getBooks(data);

    await saveData(
      books: books,
      boxName: youCanAlsoLike,
    );
    return books;
  }

  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var doc in data['docs']) {
      books.add(
        BookModel.fromJson(
          doc,
        ),
      );
    }
    return books;
  }
}
