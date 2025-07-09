import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../login/presentation/views/widgets/terms_and_consdition_text.dart';
import '../../manger/sign_up_cubit/sign_up_cubit.dart';
import 'already_have_account.dart';
import 'sign_up_bloc_listener.dart';
import 'sign_up_forms_text.dart';
import 'welcome_sing_up_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const WelcomeSignUpWidget(),
          verticalSpace(16),
          const SignUpFormsText(),
          verticalSpace(32),
          AppTextButton(
            text: 'Create Account',
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                signUpMethod(context);
              }
            },
          ),
          verticalSpace(60),
          const TermsAndConditionText(),
          verticalSpace(18),
          const AlreadyHaveAnAccount(),
          verticalSpace(12),
          const SignUpBlocListener(),
        ],
      ),
    );
  }

  void signUpMethod(BuildContext context) {
    context.read<SignUpCubit>().signUp();
  }
}
