import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomOnboardingTitle extends StatelessWidget {
  const CustomOnboardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.logo, width: 38.w, height: 38.h),
        horizontalSpace(8),
        Text('DOCBOOK', style: Styles.font30Semibold),
      ],
    );
  }
}
