import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../domin/use_cases/fetch_general_books_use_case.dart';

part 'fetch_general_books_state.dart';

class FetchGeneralBooksCubit extends Cubit<FetchGeneralBooksState> {
  FetchGeneralBooksCubit(this.fetchGeneralBooksUseCase)
    : super(FetchGeneralBooksInitial());

  final FetchGeneralBooksUseCase fetchGeneralBooksUseCase;

  Future<void> fetchGeneralBooks({ int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(
        FetchGeneralBooksLoading(),
      );
    } else {
      emit(
        FetchGeneralBooksPaginationLoading(),
      );
    }
    Either<Failure, List<BookEntity>> result = await fetchGeneralBooksUseCase
        .call(
          param: pageNumber,
        );
    result.fold(
      (failure) => emit(
        FetchGeneralBooksFailure(
          errMessage: failure.errMessage,
        ),
      ),
      (books) => emit(
        FetchGeneralBooksSuccess(
          books: books,
        ),
      ),
    );
  }
}
