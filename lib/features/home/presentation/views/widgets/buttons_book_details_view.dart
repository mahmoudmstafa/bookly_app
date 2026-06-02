import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'custom_button.dart';


class ButtonsBookDetailsView extends StatelessWidget {
  const ButtonsBookDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'FREE',
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: CustomButton(
            isRight: true,
            textStyle: AppStyles.montserrat20Regular(context),
            text: 'Free preview',
            backgroundColor: Color(
              0xffEF8262,
            ),
          ),
        ),
      ],
    );
  }
}
