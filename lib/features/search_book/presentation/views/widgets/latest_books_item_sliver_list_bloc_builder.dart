import 'dart:developer';

import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/custom_text_loading.dart';
import '../../../../home/presentation/views/widgets/latest_books_item_sliver_list.dart';
import '../../manager/cubits/search_book_cubit/search_book_cubit.dart';

class LatestBooksItemSliverListBlocBuilder extends StatefulWidget {
  const LatestBooksItemSliverListBlocBuilder({
    super.key,
    required this.dataFromUser,
  });

  final String? dataFromUser;

  @override
  State<LatestBooksItemSliverListBlocBuilder> createState() =>
      _LatestBooksItemSliverListBlocBuilderState();
}

class _LatestBooksItemSliverListBlocBuilderState
    extends State<LatestBooksItemSliverListBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBookCubit, SearchBookState>(
      listener: (context, state) {
        if (state is SearchBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SearchBookInitial) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Search for a book',
                style: AppStyles.montserrat20Bold(context),
              ),
            ),
          );
        } else if (state is SearchBookSuccess ||
            state is SearchBookPaginationLoading) {
          return LatestBooksItemSliverList(
            books: books,
          );
        } else if (state is SearchBookFailure) {
          log(
            'err --> ${state.errMessage}',
          );
          return SliverToBoxAdapter(
            child: CustomErrorMessage(
              errMessage: state.errMessage,
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: CustomTextLoading(
              messageLoading:
                  'Please Wait ... \n Loading search result ! \n " ${widget.dataFromUser} " ',
            ),
          );
        }
      },
    );
  }
}
