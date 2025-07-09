import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import 'divider_and_text.dart';
import 'email_and_password.dart';
import 'login_bloc_listener.dart';
import 'signup_text_widget.dart';
import 'terms_and_consdition_text.dart';
import 'welcome_login_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        LoginCubit cubit = context.read<LoginCubit>();
        return SingleChildScrollView(
          child: Column(
            children: [
              const WelcomeLoginWidget(),
              verticalSpace(36),
              const EmailAndPassowrd(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: Styles.font12Regular.copyWith(
                    color: ColorManager.mainBlue,
                  ),
                ),
              ),
              verticalSpace(32),
              AppTextButton(
                text: 'Login',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.loginMethod();
                  }
                },
              ),
              verticalSpace(46),
              const DividerAndText(),
              verticalSpace(60),
              const TermsAndConditionText(),
              verticalSpace(18),
              const SignUpTextWidget(),
              verticalSpace(12),
              LoginBlocListener(bloc: cubit),
            ],
          ),
        );
      },
    );
  }
}
