import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../core/utils/use_case.dart';
import '../repos/home_repo.dart';

class FetchGeneralBooksUseCase implements UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchGeneralBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({required int param}) async {
      return await homeRepo.fetchGeneralBooks(
        pageNumber: param,
      );
    }
  }
