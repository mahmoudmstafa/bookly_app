import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/custom_text_loading.dart';
import '../../manager/cubits/fetch_latest_books_cubit/fetch_latest_books_cubit.dart';
import 'latest_books_item_sliver_list.dart';
import 'book_item_list_view.dart';

class ItemListViewAndLatestBooksSection extends StatelessWidget {
  const ItemListViewAndLatestBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const ItemListView(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Latest Books',
            style: AppStyles.montserrat20Bold(context),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 22,
          ),
        ),
        BlocBuilder<FetchLatestBooksCubit, FetchLatestBooksState>(
          builder: (context, state) {
            if (state is FetchLatestBooksSuccess) {
              return LatestBooksItemSliverList(
                books: state.books,
              );
            } else if (state is FetchLatestBooksFailure) {
              return SliverToBoxAdapter(
                child: CustomErrorMessage(
                  errMessage: state.errMessage,
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: CustomTextLoading(),
              );
              // return SliverToBoxAdapter(
              //   child: CustomCircleLoading(
              //     color: Colors.white,
              //   ),
              // );
            }
          },
        ),
      ],
    );
  }
}

