import 'dart:developer';

import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/core/widgets/custom_text_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:hive/hive.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/resource.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../home/domin/enities/book_entity.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../home/presentation/views/widgets/latest_books_item_sliver_list.dart';
import '../../manager/cubits/search_book_cubit/search_book_cubit.dart';
import 'custom_text_form_field.dart';
import 'latest_books_item_sliver_list_bloc_builder.dart';

class SearchBookViewBody extends StatefulWidget {
  const SearchBookViewBody({super.key});

  @override
  State<SearchBookViewBody> createState() => _SearchBookViewBodyState();
}

class _SearchBookViewBodyState extends State<SearchBookViewBody> {
  String? dataFromUser;

  late ScrollController scrollController;
  bool isLoading = false;

  int pageNumber = 2;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    paginationData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            onTapRightIcon: navigateToHomeView,
            leftIcon: AppImages.assetsImagesBOOKLYSvg,
            rightIcon: AppImages.assetsImagesGroup2Svg,
          ),
          CustomTextFormField(
            onSubmitted: (data) async {
              dataFromUser = data;
              BlocProvider.of<SearchBookCubit>(context).searchBook(
                query: data ?? 'general',
              );
              var box = Hive.box<BookEntity>(resultsBook);
              await box.clear();
            },
            hintText: 'Search',
            enabledBorderColor: Colors.white,
            focusedBorderColor: Colors.white,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Search Result :',
            style: AppStyles.montserrat20Bold(context),
          ),
          const SizedBox(
            height: 22,
          ),
          Expanded(
            child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                LatestBooksItemSliverListBlocBuilder(
                  dataFromUser: dataFromUser,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToHomeView() {
    Get.to(
      const HomeView(),
      transition: Transition.cupertinoDialog,
      duration: kDuration,
    );
  }

  Future<void> paginationData() async {
    scrollController.addListener(
      () async {
        double currentScroll = scrollController.position.pixels;
        double maxScroll = scrollController.position.maxScrollExtent;
        if (currentScroll >= maxScroll * 0.7 - 200 && !isLoading) {
          isLoading = true;
          await BlocProvider.of<SearchBookCubit>(
            context,
          ).searchBook(
            query: dataFromUser ?? 'general',
            pageNumber: pageNumber,
          );
          pageNumber++;
          isLoading = false;
        }
      },
    );
  }
}
