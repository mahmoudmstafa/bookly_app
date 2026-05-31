import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('18Medium',style: AppStyles.montserrat18medium(context),),
    );
  }
}