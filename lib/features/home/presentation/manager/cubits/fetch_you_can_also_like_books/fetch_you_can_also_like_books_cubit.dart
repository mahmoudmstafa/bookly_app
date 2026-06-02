import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/book_model.dart';

part 'fetch_you_can_also_like_books_state.dart';

class FetchYouCanAlsoLikeBooksCubit
    extends Cubit<FetchYouCanAlsoLikeBooksState> {
  FetchYouCanAlsoLikeBooksCubit(this.homeRepoImp)
    : super(FetchYouCanAlsoLikeBooksInitial());

  final HomeRepoImp homeRepoImp;

  Future<void> fetchYouCanAlsoLikeBooksCubit() async {
    emit(
      FetchYouCanAlsoLikeBooksLoading(),
    );

    Either<Failure, List<BookModel>> result = await homeRepoImp
        .fetchYouCanAlsoLikeBooks();
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
