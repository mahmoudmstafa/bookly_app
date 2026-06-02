import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search_book/presentation/views/search_book_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../utils/constant.dart';

abstract class AppPages {
  static const splash = '/splash';
  static const home = '/home';
  static const details = '/details';
  static const search = '/search';
  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashView(),

    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: search,
      page: () => const SearchBookView(),
      transition: Transition.fade,
      transitionDuration: kDuration,
    ),
    GetPage(
      name: details,
      page: () => const BookDetailsView(),
      transition: Transition.zoom,
      transitionDuration: kDuration,
    ),
  ];
}
