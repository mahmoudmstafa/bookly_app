import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/search_book/data/repos/search_book_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/book_model.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchBookRepoImp) : super(SearchBookInitial());

  final SearchBookRepoImp searchBookRepoImp;

  Future<void> searchBook({required String query}) async {
    emit(
      SearchBookLoading(),
    );
    Either<Failure, List<BookModel>> result = await searchBookRepoImp
        .searchBook(
          query: query,
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
