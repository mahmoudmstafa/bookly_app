import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();

  Future<Either<Failure, List<BookModel>>> fetchNewBooks();
}
