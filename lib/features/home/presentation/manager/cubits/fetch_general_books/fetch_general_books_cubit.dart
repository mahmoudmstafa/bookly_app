import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/book_model.dart';
import '../../../../data/repos/home_repo.dart';

part 'fetch_general_books_state.dart';

class FetchGeneralBooksCubit extends Cubit<FetchGeneralBooksState> {
  FetchGeneralBooksCubit(this.homeRepoImp) : super(FetchGeneralBooksInitial());

  final HomeRepoImp homeRepoImp;

  Future<void> fetchGeneralBooks() async {
    emit(
      FetchGeneralBooksLoading(),
    );

    Either<Failure, List<BookModel>> result = await homeRepoImp.fetchGeneralBooks();
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
