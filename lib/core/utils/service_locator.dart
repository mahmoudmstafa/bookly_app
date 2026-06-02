import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/search_book/data/repos/search_book_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/search_book/data/repos/search_book_repo.dart';
import '../service/api_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      getIt<ApiService>(),
    ),
  );
  getIt.registerLazySingleton<SearchBookRepoImp>(
    () => SearchBookRepoImp(
      getIt<ApiService>(),
    ),
  );
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      Dio(),
    ),
  );
}
