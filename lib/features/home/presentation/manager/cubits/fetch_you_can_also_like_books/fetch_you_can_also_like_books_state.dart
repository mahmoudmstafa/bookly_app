part of 'fetch_you_can_also_like_books_cubit.dart';

@immutable
sealed class FetchYouCanAlsoLikeBooksState {}

final class FetchYouCanAlsoLikeBooksInitial extends FetchYouCanAlsoLikeBooksState {}
final class FetchYouCanAlsoLikeBooksLoading extends FetchYouCanAlsoLikeBooksState {}
final class FetchYouCanAlsoLikeBooksSuccess extends FetchYouCanAlsoLikeBooksState
{
  final List<BookModel> books;

  FetchYouCanAlsoLikeBooksSuccess({required this.books});
}
final class FetchYouCanAlsoLikeBooksFailure extends FetchYouCanAlsoLikeBooksState
{
  final String errMessage;

  FetchYouCanAlsoLikeBooksFailure({required this.errMessage});
}
