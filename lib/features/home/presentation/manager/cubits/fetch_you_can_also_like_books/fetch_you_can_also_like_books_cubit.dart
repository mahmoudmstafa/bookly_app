import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:bookly_app/features/home/domin/use_cases/fetch_you_can_also_like_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../../core/errors/failure.dart';

part 'fetch_you_can_also_like_books_state.dart';

class FetchYouCanAlsoLikeBooksCubit
    extends Cubit<FetchYouCanAlsoLikeBooksState> {
  FetchYouCanAlsoLikeBooksCubit(this.fetchYouCanAlsoLikeBooksUseCase)
    : super(FetchYouCanAlsoLikeBooksInitial());


  final FetchYouCanAlsoLikeBooksUseCase fetchYouCanAlsoLikeBooksUseCase ;

  Future<void> fetchYouCanAlsoLikeBooksCubit() async {
    emit(
      FetchYouCanAlsoLikeBooksLoading(),
    );

    Either<Failure, List<BookEntity>> result = await fetchYouCanAlsoLikeBooksUseCase.call();
    result.fold(
      (failure) => emit(
        FetchYouCanAlsoLikeBooksFailure(
          errMessage: failure.errMessage,
        ),
      ),
      (books) => emit(
        FetchYouCanAlsoLikeBooksSuccess(
          books: books,
        ),
      ),
    );
  }
}
