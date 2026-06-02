import 'package:bookly_app/features/search_book/data/repos/search_book_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/routes/app_pages.dart';
import 'core/utils/constant.dart';
import 'core/utils/service_locator.dart';
import 'features/search_book/presentation/manager/cubits/search_book_cubit/search_book_cubit.dart';

void main() {
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
        getIt<SearchBookRepoImp>(),
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
