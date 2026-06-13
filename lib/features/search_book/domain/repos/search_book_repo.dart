import 'package:dartz/dartz.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../home/domin/enities/book_entity.dart';

abstract class SearchBookRepo {
  Future<Either<Failure, List<BookEntity>>> searchBook({required String query , required int pageNumber});
}
