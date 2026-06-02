import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/core/service/api_service.dart';
import 'package:bookly_app/features/search_book/data/repos/search_book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchBookRepoImp implements SearchBookRepo {
  SearchBookRepoImp(this.apiService);

  ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> searchBook({
    required String query,
  }) async {
    try {
      Map<String, dynamic> data = await apiService.get(endPoint: 'q=$query');

      List<BookModel> books = [];
      for (var book in data['docs']) {
        books.add(
          BookModel.fromJson(
            book,
          ),
        );
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: 'Ops there was an error ! Please try again .',
        ),
      );
    }
  }
}
