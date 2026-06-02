part of 'fetch_general_books_cubit.dart';

@immutable
sealed class FetchGeneralBooksState {}

final class FetchGeneralBooksInitial extends FetchGeneralBooksState {}

final class FetchGeneralBooksLoading extends FetchGeneralBooksState {}

final class FetchGeneralBooksSuccess extends FetchGeneralBooksState {
  final List<BookModel> books;

  FetchGeneralBooksSuccess({required this.books});
}

final class FetchGeneralBooksFailure extends FetchGeneralBooksState {
  final String errMessage;

  FetchGeneralBooksFailure({required this.errMessage});
}
