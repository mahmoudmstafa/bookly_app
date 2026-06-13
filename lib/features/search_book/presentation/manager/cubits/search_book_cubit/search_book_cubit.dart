import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:bookly_app/features/search_book/data/repos/search_book_repo_imp.dart';
import 'package:bookly_app/features/search_book/domain/repos/search_book_repo.dart';
import 'package:bookly_app/features/search_book/domain/use_cases/search_book_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../../core/errors/failure.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchBookUseCase) : super(SearchBookInitial());

  final SearchBookUseCase searchBookUseCase;

  Future<void> searchBook({
    required String query,
    int pageNumber = 1,
  }) async {
    if (pageNumber == 1) {
      emit(
        SearchBookLoading(),
      );
    } else {
      emit(
        SearchBookPaginationLoading(),
      );
    }
    Either<Failure, List<BookEntity>> result = await searchBookUseCase.call(
      param: SearchBookParams(
        query: query,
        pageNumber: pageNumber,
      ),
    );
    result.fold(
      (failure) => emit(
        SearchBookFailure(
          errMessage: failure.errMessage,
        ),
      ),
      (books) => emit(
        SearchBookSuccess(
          books: books,
        ),
      ),
    );
  }
}
