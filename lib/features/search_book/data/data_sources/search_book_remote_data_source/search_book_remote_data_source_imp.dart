import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:bookly_app/features/search_book/data/data_sources/search_book_remote_data_source/search_book_remote_data_source.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/func/save_local_data.dart';
import '../../../../../core/models/book_model.dart';
import '../../../../../core/service/api_service.dart';
import '../../../../../core/utils/constant.dart';

class SearchBookRemoteDataSourceImp implements SearchBookRemoteDataSource {
  final ApiService apiService;

  SearchBookRemoteDataSourceImp(this.apiService);

  @override
  Future<List<BookEntity>> searchBook({required String query , required int pageNumber}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'q=$query&limit=10&page=$pageNumber',
    );
    List<BookEntity> books = getBooks(data);
    await saveData(
      books: books,
      boxName: resultsBook,
    );
    return books;
  }

  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var doc in data['docs']) {
      books.add(
        BookModel.fromJson(
          doc,
        ),
      );
    }
    return books;
  }
}
