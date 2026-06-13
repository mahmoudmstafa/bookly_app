import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../data/data_sources/home_local_data_source/home_local_data_source.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchGeneralBooks({required int pageNumber});

  Future<Either<Failure, List<BookEntity>>> fetchLatestBooks({required int pageNumber});
  Future<Either<Failure, List<BookEntity>>> fetchYouCanAlsoLikeBooks();
}


