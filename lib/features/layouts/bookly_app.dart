import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/layouts/mobile_layout.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../core/utils/adaptive_layout.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) {
        return MobileLayout() ;
      },
      tabletLayout: (BuildContext context) {
        return SizedBox() ;
      },
      desktopLayout: (BuildContext context) {
        return SizedBox() ;
      },
    );
  }
}
