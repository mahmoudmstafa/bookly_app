import 'dart:developer';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/service/api_service.dart';


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/book_model.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  HomeRepoImp(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> fetchGeneralBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(endPoint: 'q=general');
      List<BookModel> books = [];
      for (var book in data['docs']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      log(
        'the error is -->$e',
      );
      return left(
        ServerFailure(
          errMessage: 'Ops there was an error ! Please try again .',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchLatestBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: 'q=history',
      );
      List<BookModel> books = [];
      for (var book in data['docs']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      log(
        'the error is -->$e',
      );
      return left(
        ServerFailure(
          errMessage: 'Ops there was an error ! Please try again .',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchYouCanAlsoLikeBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: 'q=programming',
      );
      List<BookModel> books = [];
      for (var book in data['docs']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      log(
        'the error is -->$e',
      );
      return left(
        ServerFailure(
          errMessage: 'Ops there was an error ! Please try again .',
        ),
      );
    }
  }
}
