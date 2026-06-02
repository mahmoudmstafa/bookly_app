import 'dart:developer';

import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_book_item_image.dart';
import '../../../../../core/widgets/custom_circle_loading.dart';
import '../../manager/cubits/fetch_general_books/fetch_general_books_cubit.dart';
import '../book_details_view.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .28,
        child: BlocBuilder<FetchGeneralBooksCubit, FetchGeneralBooksState>(
          builder: (context, state) {
            if (state is FetchGeneralBooksSuccess) {
              return ListView.separated(
                separatorBuilder: (_, _) => SizedBox(
                  width: 8,
                ),
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return CustomBookItemImage(
                    bookModel: state.books[index],
                    aspectRatio: 130 / 193,
                  );
                },
              );
            } else if (state is FetchGeneralBooksFailure) {
              return CustomErrorMessage(
                errMessage: state.errMessage,
              );
            } else {
              return CustomCircleLoading(
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
