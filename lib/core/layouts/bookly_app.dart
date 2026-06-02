import 'package:flutter/material.dart';

import '../../core/utils/adaptive_layout.dart';
import 'mobile_layout.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) {
        return const MobileLayout() ;
      },
      tabletLayout: (BuildContext context) {
        return const SizedBox() ;
      },
      desktopLayout: (BuildContext context) {
        return const SizedBox() ;
      },
    );
  }
}
