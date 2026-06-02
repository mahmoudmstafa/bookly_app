import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchGeneralBooks();

  Future<Either<Failure, List<BookModel>>> fetchLatestBooks();
  Future<Either<Failure, List<BookModel>>> fetchYouCanAlsoLikeBooks();

}
