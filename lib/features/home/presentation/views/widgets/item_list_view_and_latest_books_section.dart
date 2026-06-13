import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/custom_text_loading.dart';
import '../../manager/cubits/fetch_latest_books_cubit/fetch_latest_books_cubit.dart';
import 'item_list_view_bloc_consumer.dart';
import 'latest_books_item_sliver_list.dart';
import 'latest_books_item_sliver_list_bloc_consumer.dart';

class ItemListViewAndLatestBooksSection extends StatefulWidget {
  const ItemListViewAndLatestBooksSection({super.key});

  @override
  State<ItemListViewAndLatestBooksSection> createState() =>
      _ItemListViewAndLatestBooksSectionState();
}

class _ItemListViewAndLatestBooksSectionState
    extends State<ItemListViewAndLatestBooksSection> {
  late ScrollController scrollController;
  bool isLoading = false;

  int pageNumber = 2;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const ItemListViewBlocConsumer(),
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
        const LatestBooksItemSliverListBlocConsumer(),
      ],
    );
  }

  void _onScroll() async {
    if (!scrollController.hasClients) return;

    final currentScroll = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;

    if (currentScroll >= maxScroll * 0.7 && !isLoading) {
      isLoading = true;

      await BlocProvider.of<FetchLatestBooksCubit>(context)
          .fetchLatestBooks(pageNumber: pageNumber);

      pageNumber++;
      isLoading = false;
    }
  }}
