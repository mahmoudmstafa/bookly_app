import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/custom_text_loading.dart';
import '../../../domin/enities/book_entity.dart';
import '../../manager/cubits/fetch_latest_books_cubit/fetch_latest_books_cubit.dart';
import 'latest_books_item_sliver_list.dart';
import 'latest_books_list_view_loading.dart';

class LatestBooksItemSliverListBlocConsumer extends StatefulWidget {
  const LatestBooksItemSliverListBlocConsumer({
    super.key,
  });

  @override
  State<LatestBooksItemSliverListBlocConsumer> createState() =>
      _LatestBooksItemSliverListBlocConsumerState();
}

class _LatestBooksItemSliverListBlocConsumerState
    extends State<LatestBooksItemSliverListBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchLatestBooksCubit, FetchLatestBooksState>(
      listener: (context, state) {
        if (state is FetchLatestBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FetchLatestBooksSuccess ||
            state is FetchLatestBooksPaginationLoading) {
          return LatestBooksItemSliverList(
            books: books,
          );
        } else if (state is FetchLatestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorMessage(
              errMessage: state.errMessage,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: LatestBooksListViewLoading(),
          );
        }
      },
    );
  }
}
