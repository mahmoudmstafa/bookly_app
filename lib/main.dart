import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/utils/constant.dart';
import 'features/book_details/presentation/views/book_details_view.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/search_book/presentation/views/search_book_view.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(
    const BooklyApp(),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kPrimaryColor,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.id: (context) => const SplashView(),
        HomeView.id: (context) => const HomeView(),
        BookDetailsView.id: (context) => const BookDetailsView(),
        SearchBookView.id: (context) => const SearchBookView(),
      },
      initialRoute: SplashView.id,
    );
  }
}
