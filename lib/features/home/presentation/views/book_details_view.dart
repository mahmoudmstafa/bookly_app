import 'package:bookly_app/features/home/domin/enities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../../core/entities/book_entity.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/home_repo_imp.dart';
import '../../domin/use_cases/fetch_you_can_also_like_books_use_case.dart';
import '../manager/cubits/fetch_you_can_also_like_books/fetch_you_can_also_like_books_cubit.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  static const String id = 'BookDetailsView';

  @override
  Widget build(BuildContext context) {
    final books = Get.arguments as BookEntity;
    return Scaffold(
      body: BlocProvider(
        create: (context) => FetchYouCanAlsoLikeBooksCubit(
          FetchYouCanAlsoLikeBooksUseCase(
            getIt.get<HomeRepoImpl>()
          )
        )..fetchYouCanAlsoLikeBooksCubit(),
        child: BookDetailsViewBody(
          bookEntity: books,
        ),
      ),
    );
  }
}
