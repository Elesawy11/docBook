import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/styles.dart';

class CustomOnboardingBody extends StatelessWidget {
  const CustomOnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.logoOpacity,
          fit: BoxFit.fill,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(Assets.onboarding),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor\n Appointment App',
            textAlign: TextAlign.center,
            style: Styles.font32Bold.copyWith(
              color: ColorManager.mainBlue,
            ),
          ),
        ),
      ],
    );
  }
}
