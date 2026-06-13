




import '../../../../../core/entities/book_entity.dart';

abstract class HomeRemoteDataSource
{
  Future<List<BookEntity>> fetchGeneralBooks({required int pageNumber}) ;
  Future<List<BookEntity>> fetchLatestBooks({required int pageNumber}) ;
  Future<List<BookEntity>> fetchYouCanAlsoLikeBooks() ;
}
