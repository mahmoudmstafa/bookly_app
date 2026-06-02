import 'package:bookly_app/features/home/presentation/manager/cubits/fetch_latest_books_cubit/fetch_latest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/home_repo.dart';
import '../../data/repos/home_repo_imp.dart';
import '../manager/cubits/fetch_general_books/fetch_general_books_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FetchGeneralBooksCubit(
              getIt<HomeRepoImp>(),
            )..fetchGeneralBooks(),
          ),
          BlocProvider(
            create: (context) => FetchLatestBooksCubit(
              getIt<HomeRepoImp>(),
            )..fetchLatestBooks(),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
