import 'package:flutter/material.dart';

import '../../../../../core/utils/spacer.dart';
import 'custom_onboarding_body.dart';
import 'custom_onboarding_title.dart';
import 'custom_text_and_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(24),
            const CustomOnboardingTitle(),
            verticalSpace(40),
            const CustomOnboardingBody(),
            const CustomTextAndTextButton(),
          ],
        ),
      ),
    );
  }
}
