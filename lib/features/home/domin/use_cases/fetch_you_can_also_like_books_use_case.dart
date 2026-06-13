



import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domin/repos/home_repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../core/utils/use_case_no_param.dart';


class FetchYouCanAlsoLikeBooksUseCase implements UseCase
{

  final HomeRepo homeRepo ;

  FetchYouCanAlsoLikeBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchYouCanAlsoLikeBooks();
  }

}