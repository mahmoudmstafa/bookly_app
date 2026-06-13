import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../core/utils/use_case.dart';
import '../repos/search_book_repo.dart';

class SearchBookUseCase
    implements UseCase<List<BookEntity>, SearchBookParams> {

  final SearchBookRepo searchBookRepo;

  SearchBookUseCase(this.searchBookRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({
    required SearchBookParams param,
  }) {
    return searchBookRepo.searchBook(
      query: param.query,
      pageNumber: param.pageNumber,
    );
  }
}
class SearchBookParams {
  final String query;
  final int pageNumber;

  SearchBookParams({
    required this.query,
    required this.pageNumber,
  });
}
