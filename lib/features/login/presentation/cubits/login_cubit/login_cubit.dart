import 'package:bloc/bloc.dart';
import 'package:doc_book/core/networking/api_result.dart';
import 'package:doc_book/features/login/data/models/login_request.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(const LoginState.initial());
  final LoginRepoImpl _repo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> loginMethod() async {
    emit(const LoginState.loginLoading());

    final response = await _repo.login(
      data: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    switch (response) {
      case Success():
        emit(LoginState.loginSuccess(response: response.data));
        getIt.get<SharedPreferences>().setString(
          'token',
          response.data.userData?.token ?? '',
        );
        break;
      case Failure():
        emit(
          LoginState.loginError(
            error:
                response.errorHandler.apiErrorModel.message ?? 'Unkwon error',
          ),
        );
    }
  }
}
