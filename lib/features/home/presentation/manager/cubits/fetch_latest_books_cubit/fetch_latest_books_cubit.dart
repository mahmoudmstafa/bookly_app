import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/book_model.dart';
import '../../../../data/repos/home_repo.dart';

part 'fetch_latest_books_state.dart';

class FetchLatestBooksCubit extends Cubit<FetchLatestBooksState> {
  FetchLatestBooksCubit(this.homeRepoImp) : super(FetchLatestBooksInitial());

  final HomeRepoImp homeRepoImp;

  Future<void> fetchLatestBooks() async {
    emit(
      FetchLatestBooksLoading(),
    );
    Either<Failure, List<BookModel>> result = await homeRepoImp
        .fetchLatestBooks();
    result.fold(
      (failure) => emit(
        FetchLatestBooksFailure(
          errMessage: failure.errMessage,
        ),
      ),
      (books) => emit(
        FetchLatestBooksSuccess(
          books: books,
        ),
      ),
    );
  }
}
