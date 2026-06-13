import 'package:bookly_app/core/errors/failure.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../core/utils/use_case.dart';
import '../repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchLatestBooksUseCase implements UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchLatestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({required int param}) {
    return homeRepo.fetchLatestBooks(
      pageNumber: param,
    );
  }
}
