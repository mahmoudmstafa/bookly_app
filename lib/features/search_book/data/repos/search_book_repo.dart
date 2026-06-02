




import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/book_model.dart';

abstract class SearchBookRepo
{
  Future<Either<Failure, List<BookModel>>> searchBook({required String query});
}