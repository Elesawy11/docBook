import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(16),
                const CustomAppBarWidget(
                  text: 'Personal Information',
                ),
                verticalSpace(48),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.profile,
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
                verticalSpace(50),
                AppTextFormField(
                  hintText: 'Omar',
                  validator: (p0) {},
                ),
                verticalSpace(16),
                AppTextFormField(
                  hintText: 'omarahmed14@gmail.com',
                  validator: (p0) {},
                ),
                verticalSpace(16),
                AppTextFormField(
                  hintText: 'Password',
                  validator: (p0) {},
                ),
                verticalSpace(16),
                AppTextFormField(
                  hintText: '010123456',
                  validator: (p0) {},
                ),
                verticalSpace(24),
                Text(
                  'When you set up your personal information settings, you should take care to provide accurate information.',
                  style: Styles.font12Regular.copyWith(
                    color: ColorManager.grey75,
                  ),
                ),
                verticalSpace(64),
                AppTextButton(
                  text: 'Save',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
