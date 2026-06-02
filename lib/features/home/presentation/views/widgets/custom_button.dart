import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    required this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.isRight = false,
  });

  final VoidCallback? onTap;

  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;

  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isRight ? 0 : 15),
            bottomLeft: Radius.circular(isRight ? 0 : 15),
            topRight: Radius.circular(isRight ? 15 : 0),
            bottomRight: Radius.circular(isRight ? 15 : 0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ?? AppStyles.montserrat18Bold(context),
          ),
        ),
      ),
    );
  }
}
