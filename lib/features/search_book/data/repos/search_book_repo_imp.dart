import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../home/domin/enities/book_entity.dart';
import '../../domain/repos/search_book_repo.dart';
import '../data_sources/search_book_remote_data_source/search_book_remote_data_source.dart';
import '../data_sources/search_book_remote_data_source/search_book_remote_data_source_imp.dart';

class SearchBookRepoImp implements SearchBookRepo {
  final SearchBookRemoteDataSource searchBookRemoteDataSource;

  SearchBookRepoImp({
    required this.searchBookRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> searchBook({
    required String query,
    required int pageNumber,
  }) async {
    try {
      var remoteData = await searchBookRemoteDataSource.searchBook(
        query: query,
        pageNumber: 1,
      );
      return right(remoteData);
    } catch (e, stackTrace) {
      log('err --> $e');
      log('stackTrace --> $stackTrace');

      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(
            e,
          ),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
