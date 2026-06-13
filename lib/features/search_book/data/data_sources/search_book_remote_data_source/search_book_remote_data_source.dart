import 'dart:developer' show log;

import 'package:bookly_app/core/service/api_service.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:bookly_app/features/search_book/data/data_sources/search_book_remote_data_source/search_book_remote_data_source_imp.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/func/save_local_data.dart';
abstract class SearchBookRemoteDataSource {
  Future<List<BookEntity>> searchBook({
    required String query,
    required int pageNumber,
  });
}

