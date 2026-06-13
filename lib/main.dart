import 'package:bookly_app/features/search_book/data/repos/search_book_repo_imp.dart';
import 'package:bookly_app/features/search_book/domain/repos/search_book_repo.dart';
import 'package:bookly_app/features/search_book/domain/use_cases/search_book_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';

import 'core/routes/app_pages.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/constant.dart';
import 'core/utils/hive_services.dart';
import 'core/utils/service_locator.dart';
import 'features/search_book/presentation/manager/cubits/search_book_cubit/search_book_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  Bloc.observer = SimpleBlocObserver();
  setupLocator();
  runApp(
    const BooklyApp(),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBookCubit(
        getIt.get<SearchBookUseCase>(),
      ),
      child: GetMaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: kPrimaryColor,
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: AppPages.splash,
      ),
    );
  }
}
