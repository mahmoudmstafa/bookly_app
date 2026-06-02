import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        const Expanded(
          child: CustomButton(
            text: 'FREE',
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: () async {
              await openWebsite(
                Uri.parse(
                  'https://flutter.dev',
                ),
              );
            },
            isRight: true,
            textStyle: AppStyles.montserrat20Regular(context),
            text: 'Free preview',
            backgroundColor: const Color(
              0xffEF8262,
            ),
          ),
        ),
      ],
    );
  }
  Future<void> openWebsite(Uri url) async {
    final result = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    print(result);

    if (!result) {
      throw Exception('Could not launch');
    }
  }
}
