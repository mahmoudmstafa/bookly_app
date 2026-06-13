import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_animation_loading_widget.dart';

class CustomBookItemImageLoading extends StatelessWidget {
  const CustomBookItemImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimationLoadingWidget(
      child: AspectRatio(
        aspectRatio: 130 / 193,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
