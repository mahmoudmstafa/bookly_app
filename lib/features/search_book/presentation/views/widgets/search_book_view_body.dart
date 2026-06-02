import 'package:bookly_app/core/widgets/custom_circle_loading.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/resource.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../home/presentation/views/widgets/latest_books_item_sliver_list.dart';
import '../../manager/cubits/search_book_cubit/search_book_cubit.dart';
import 'custom_text_form_field.dart';

class SearchBookViewBody extends StatelessWidget {
  const SearchBookViewBody({super.key});

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
            onSubmitted: (data) {
              BlocProvider.of<SearchBookCubit>(context).searchBook(
                query: data ?? 'general',
              );
            },
            hintText: 'Search',
            enabledBorderColor: Colors.white,
            focusedBorderColor: Colors.white,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Search Result :',
            style: AppStyles.montserrat20Bold(context),
          ),
          SizedBox(
            height: 22,
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                BlocBuilder<SearchBookCubit, SearchBookState>(
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
                    } else if (state is SearchBookSuccess) {
                      return LatestBooksItemSliverList(
                        books: state.books,
                      );
                    } else if (state is SearchBookFailure) {
                      return SliverToBoxAdapter(
                        child: CustomErrorMessage(
                          errMessage: state.errMessage,
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: CustomCircleLoading(
                          color: Colors.white,
                        ),
                      );
                    }
                  },
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
      HomeView(),
      transition: Transition.cupertinoDialog,
      duration: kDuration,
    );
  }
}
