import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/fetch_you_can_also_like_books/fetch_you_can_also_like_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_book_item_image.dart';

class YouCanAlsoLikeListView extends StatelessWidget {
  const YouCanAlsoLikeListView({
    super.key, this.onTap,
  });

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .2,
      child:
          BlocBuilder<
            FetchYouCanAlsoLikeBooksCubit,
            FetchYouCanAlsoLikeBooksState
          >(
            builder: (context, state) {
              if (state is FetchYouCanAlsoLikeBooksSuccess) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 6),
                  itemBuilder: (context, index) {
                    return CustomBookItemImage(
                      bookModel: state.books[index],
                      borderRadius: 8,
                      aspectRatio: 70 / 112,
                    );
                  },
                );
              } else if (state is FetchYouCanAlsoLikeBooksFailure) {
                return CustomErrorMessage(
                  errMessage: state.errMessage,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
    );
  }
}
