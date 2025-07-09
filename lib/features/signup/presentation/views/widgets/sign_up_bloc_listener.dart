import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/sign_up_cubit/sign_up_cubit.dart';
import '../../manger/sign_up_cubit/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is SignupLoading ||
            current is SignupError ||
            current is SignupSuccess;
      },
      listener: (context, state) {
        state is SignupError
            ? loginFailureAction(context, state)
            : state is SignupLoading
            ? showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                },
              )
            : {context.pop(), context.go(Routes.homeView)};
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> loginFailureAction(BuildContext context, SignupError state) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red),
          content: Text(state.error, style: Styles.font14Regular),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
                GoRouter.of(context).pop();
              },
              child: Text(
                'Got it',
                style: Styles.font14Regular.copyWith(
                  color: ColorManager.mainBlue,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
