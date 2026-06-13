import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../domin/repos/home_repo.dart';
import '../data_sources/home_local_data_source/home_local_data_source.dart';
import '../data_sources/home_remote_data_source/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchGeneralBooks({
    required int pageNumber,
  }) async {
    try {
      var localBooks = homeLocalDataSource.getLocalGeneralBooks(
        pageNumber: pageNumber,
      );
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
      var remoteBooks = await homeRemoteDataSource.fetchGeneralBooks(
        pageNumber: pageNumber,
      );
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          Failure(
            errMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchLatestBooks({
    required int pageNumber,
  }) async {
    try {

      var localBooks = homeLocalDataSource.getLocalLatestBooks(
        pageNumber: pageNumber,
      );
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
      var remoteBooks = await homeRemoteDataSource.fetchLatestBooks(
        pageNumber: pageNumber,
      );
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          Failure(
            errMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchYouCanAlsoLikeBooks() async {
    try {
      var remoteBooks = await homeRemoteDataSource.fetchYouCanAlsoLikeBooks();
      var localBooks = homeLocalDataSource.getYouCanAlsoLikeBooks();
      if (localBooks.isEmpty) {
        return right(remoteBooks);
      }
      return right(localBooks);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          Failure(
            errMessage: e.toString(),
          ),
        );
      }
    }
  }
}
