import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import 'password_validation.dart';

class EmailAndPassowrd extends StatelessWidget {
  const EmailAndPassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please enter valide email';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter valide password';
              }
            },
            isPassword: true,
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
