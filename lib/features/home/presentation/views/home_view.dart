import 'package:bookly_app/features/home/domin/use_cases/fetch_latest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/fetch_latest_books_cubit/fetch_latest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repos/home_repo_imp.dart';
import '../../domin/use_cases/fetch_general_books_use_case.dart';
import '../manager/cubits/fetch_general_books/fetch_general_books_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          _fetchGeneralBooksCubit(),
          _fetchLatestBooksCubit(),
        ],
        child: const HomeViewBody(),
      ),
    );
  }

  BlocProvider<FetchGeneralBooksCubit> _fetchGeneralBooksCubit() => BlocProvider(
    create: (context) => FetchGeneralBooksCubit(
      FetchGeneralBooksUseCase(
        getIt.get<HomeRepoImpl>(),
      ),
    )..fetchGeneralBooks(),
  );

  BlocProvider<FetchLatestBooksCubit> _fetchLatestBooksCubit() => BlocProvider(
    create: (context) => FetchLatestBooksCubit(
      FetchLatestBooksUseCase(
        getIt.get<HomeRepoImpl>(),
      ),
    )..fetchLatestBooks(),
  );
}
