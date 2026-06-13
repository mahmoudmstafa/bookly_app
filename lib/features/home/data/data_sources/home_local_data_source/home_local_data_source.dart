




import '../../../../../core/entities/book_entity.dart';

abstract class HomeLocalDataSource
{
  List<BookEntity> getLocalGeneralBooks ({required int pageNumber});
  List<BookEntity> getLocalLatestBooks ({required int pageNumber});
  List<BookEntity> getYouCanAlsoLikeBooks ();
}