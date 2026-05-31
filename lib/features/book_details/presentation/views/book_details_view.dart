import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/core/widgets/custom_appbar.dart';
import 'package:bookly_app/features/book_details/presentation/views/widgets/book_details_list_view_items.dart';
import 'package:bookly_app/features/book_details/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/book_details/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly_app/features/book_details/presentation/views/widgets/buttons_book_details_view.dart';
import 'package:bookly_app/features/book_details/presentation/views/widgets/custom_button.dart';
import 'package:bookly_app/features/book_details/presentation/views/widgets/you_can_also_like_section.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource.dart';
import '../../../../core/widgets/custom_best_seller_evaluation.dart';
import '../../../../core/widgets/custom_book_item_image.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  static const String id = 'BookDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(),
    );
  }


}
