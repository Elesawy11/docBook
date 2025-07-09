import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, required this.bloc});
  final LoginCubit bloc;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is LoginLoading ||
            current is LoginError ||
            current is LoginSuccess;
      },
      listener: (context, state) {
        state is LoginError
            ? loginFailureAction(context, state)
            : state is LoginLoading
            ? showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                },
              )
            : {GoRouter.of(context).pop(), context.go(Routes.homeView)};
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> loginFailureAction(BuildContext context, LoginError state) {
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
