import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_styles.dart';

class CustomTextLoading extends StatelessWidget {
  const CustomTextLoading({super.key, this.messageLoading});

  final String? messageLoading;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: AutoSizeText(
        minFontSize: 10,
        messageLoading ?? 'Loading latest books...',
        textAlign: TextAlign.center,
        style: AppStyles.regular30Roboto(context),
      ),
    );
  }
}
