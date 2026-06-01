import 'package:bookly_app/features/search_book/presentation/views/widgets/search_book_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/resource.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../home/presentation/views/home_view.dart';

class SearchBookView extends StatelessWidget {
  const SearchBookView({super.key});

  static const String id = 'SearchBookView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBookViewBody(),
    );
  }
}
