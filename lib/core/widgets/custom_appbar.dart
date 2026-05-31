import 'package:bookly_app/core/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.rightIcon,
    required this.leftIcon,
  });

  final String rightIcon, leftIcon;

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
            SvgPicture.asset(
              rightIcon,
            ),
            SvgPicture.asset(
              leftIcon,
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
