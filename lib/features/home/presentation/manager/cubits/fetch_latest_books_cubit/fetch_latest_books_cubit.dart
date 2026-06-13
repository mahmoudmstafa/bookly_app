import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../domin/use_cases/fetch_latest_books_use_case.dart';

part 'fetch_latest_books_state.dart';

class FetchLatestBooksCubit extends Cubit<FetchLatestBooksState> {
  FetchLatestBooksCubit(this.fetchLatestBooksUseCase)
    : super(FetchLatestBooksInitial());

  final FetchLatestBooksUseCase fetchLatestBooksUseCase;

  Future<void> fetchLatestBooks({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(
        FetchLatestBooksLoading(),
      );
    } else {
      emit(
        FetchLatestBooksPaginationLoading(),
      );
    }
    Either<Failure, List<BookEntity>> result = await fetchLatestBooksUseCase
        .call(param: pageNumber);
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
