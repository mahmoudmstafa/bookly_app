import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/models/book_model.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_book_item_image.dart';
import '../../data/repos/home_repo_imp.dart';
import '../manager/cubits/fetch_you_can_also_like_books/fetch_you_can_also_like_books_cubit.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  static const String id = 'BookDetailsView';

  @override
  Widget build(BuildContext context) {
    final books = Get.arguments as BookModel;
    return Scaffold(
      body: BlocProvider(
        create: (context) => FetchYouCanAlsoLikeBooksCubit(
          getIt<HomeRepoImp>(),
        )..fetchYouCanAlsoLikeBooksCubit(),
        child: BookDetailsViewBody(
          bookModel: books,
        ),
      ),
    );
  }
}
