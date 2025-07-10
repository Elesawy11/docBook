import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/password_validation_method.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../manger/sign_up_cubit/sign_up_cubit.dart';

class SignUpFormsText extends StatelessWidget {
  const SignUpFormsText({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The name field is required.';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: cubit.phoneController,
            hintText: 'Phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The phone field is required.';
              }
              if (!AppRegex.isPhoneNumberValid(value)) {
                return 'please enter valid phone number';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The email field is required.';
              }
              if (!AppRegex.isEmailValid(value)) {
                return 'please enter valid email';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: cubit.passwordController,
            hintText: 'Password',
            validator: (value) => passwordValidation(value),
            isPassword: true,
          ),
          verticalSpace(24),
          AppTextFormField(
            controller: cubit.passwordConfirmationController,
            hintText: 'Password confirmation',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The password confirmation field is required.';
              }
              if (value != cubit.passwordController.text.trim()) {
                return 'Passwords do not match.';
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
