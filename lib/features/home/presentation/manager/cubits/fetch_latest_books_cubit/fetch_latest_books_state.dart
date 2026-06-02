part of 'fetch_latest_books_cubit.dart';

@immutable
sealed class FetchLatestBooksState {}

final class FetchLatestBooksInitial extends FetchLatestBooksState {}
final class FetchLatestBooksLoading extends FetchLatestBooksState {}
final class FetchLatestBooksSuccess extends FetchLatestBooksState
{
  final List<BookModel> books;

  FetchLatestBooksSuccess({required this.books});
}
final class FetchLatestBooksFailure extends FetchLatestBooksState
{
  final String errMessage;

  FetchLatestBooksFailure({required this.errMessage});
}
