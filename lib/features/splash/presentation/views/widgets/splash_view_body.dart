import 'package:bookly_app/core/routes/app_pages.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text_animation.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    animationSlidingText();

    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SplashLogo(),
            const SizedBox(
              height: 10,
            ),
            SlidingTextAnimation(
              animationController: animationController,
              animation: animation,
            ),
          ],
        ),
      ),
    );
  }

  void animationSlidingText() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(
        AppPages.home,
      );
    });
  }
}
