import 'package:bookly_app/core/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.rightIcon,
    required this.leftIcon,
    this.onTapRightIcon,
    this.onTapLeftIcon,
  });

  final String rightIcon, leftIcon;
  final void Function()? onTapRightIcon, onTapLeftIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTapRightIcon,
              child: SvgPicture.asset(
                rightIcon,
              ),
            ),
            GestureDetector(
              onTap: onTapLeftIcon,
              child: SvgPicture.asset(
                leftIcon,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
