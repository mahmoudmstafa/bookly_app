import 'package:flutter/material.dart';

import '../../../../../core/utils/resource.dart';



class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 130 / 193,
      child: Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.assetsImagesBook1HightlighPng,
            ),
          ),
        ),
      ),
    );
  }
}
