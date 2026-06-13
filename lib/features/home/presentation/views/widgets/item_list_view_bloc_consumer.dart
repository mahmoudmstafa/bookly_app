import 'dart:developer' show log;

import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/book_entity.dart';
import '../../../../../core/widgets/custom_circle_loading.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../manager/cubits/fetch_general_books/fetch_general_books_cubit.dart';
import 'book_item_list_view.dart';

class ItemListViewBlocConsumer extends StatefulWidget {
  const ItemListViewBlocConsumer({super.key});

  @override
  State<ItemListViewBlocConsumer> createState() =>
      _ItemListViewBlocConsumerState();
}

class _ItemListViewBlocConsumerState extends State<ItemListViewBlocConsumer> {
  late final ScrollController controller;

  bool isLoading = false;
  int pageNumber = 1;

  List<BookEntity> books = [];

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    paginationData();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .28,
        child: BlocConsumer<FetchGeneralBooksCubit, FetchGeneralBooksState>(
          listener: (context, state) {
            if (state is FetchGeneralBooksSuccess) {
              books.addAll(state.books);
            }
          },
          builder: (context, state) {
            if (state is FetchGeneralBooksSuccess ||
                state is FetchGeneralBooksPaginationLoading) {
              return ItemListView(
                controller: controller,
                books: books,
              );
            } else if (state is FetchGeneralBooksFailure) {
              return CustomErrorMessage(
                errMessage: state.errMessage,
              );
            } else {
              return const CustomCircleLoading(
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> paginationData() async {
    controller.addListener(
      () async {
        final currentScroll = controller.offset;
        final maxScroll = controller.position.maxScrollExtent;

        if (currentScroll >= maxScroll * 0.7 - 200 && isLoading == false) {
          isLoading = true;
          pageNumber++;
          await BlocProvider.of<FetchGeneralBooksCubit>(
            context,
          ).fetchGeneralBooks(
            pageNumber: pageNumber,
          );
          isLoading = false;
        }
      },
    );
  }
}
