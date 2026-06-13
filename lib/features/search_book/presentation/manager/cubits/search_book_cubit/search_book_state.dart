part of 'search_book_cubit.dart';

@immutable
sealed class SearchBookState {}

final class SearchBookInitial extends SearchBookState {}
final class SearchBookLoading extends SearchBookState {}
final class SearchBookSuccess extends SearchBookState
{
  final List<BookEntity> books;

  SearchBookSuccess({required this.books});
}
final class SearchBookFailure extends SearchBookState
{
  final String errMessage;

  SearchBookFailure({required this.errMessage});
}
final class SearchBookPaginationLoading extends SearchBookState
{

}
