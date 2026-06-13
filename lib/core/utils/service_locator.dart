import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/domin/repos/home_repo.dart';
import 'package:bookly_app/features/search_book/data/data_sources/search_book_remote_data_source/search_book_remote_data_source.dart';
import 'package:bookly_app/features/search_book/data/repos/search_book_repo_imp.dart';
import 'package:bookly_app/features/search_book/domain/use_cases/search_book_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/home_local_data_source/home_local_data_source_impl.dart';
import '../../features/home/data/data_sources/home_remote_data_source/home_remote_data_source_impl.dart';
import '../../features/home/domin/use_cases/fetch_latest_books_use_case.dart';
import '../../features/home/presentation/manager/cubits/fetch_general_books/fetch_general_books_cubit.dart';
import '../../features/search_book/data/data_sources/search_book_remote_data_source/search_book_remote_data_source_imp.dart';
import '../service/api_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerLazySingleton<SearchBookUseCase>(
    () => SearchBookUseCase(
      SearchBookRepoImp(
        searchBookRemoteDataSource: SearchBookRemoteDataSourceImp(
          getIt.get<ApiService>(),
        ),
      ),
    ),
  );

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      Dio(),
    ),
  );
}
