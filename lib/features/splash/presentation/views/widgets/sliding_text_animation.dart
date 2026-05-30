import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SlidingTextAnimation extends StatelessWidget {
  const SlidingTextAnimation({
    super.key,
    required this.animationController,
    required this.animation,
  });

  final AnimationController animationController;
  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: animation,
          child: Text(
            'Get Free Books Now!',
            textAlign: TextAlign.center,
            style: AppStyles.regular16Roboto(context),
          ),
        );
      },
    );
  }
}
