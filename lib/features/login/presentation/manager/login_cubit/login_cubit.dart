import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/login_request.dart';
import '../../../data/models/login_response.dart';
import '../../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> loginMethod(LoginRequestBody loginRequest) async {
    emit(LoginLoading());

    var response = await loginRepo.login(loginRequest);

    response.fold(
      (failure) =>
          emit(LoginFailure(failure.apiErrorModel.message ?? 'unKnowen error')),
      (responseBody) async {
        getIt.get<SharedPreferences>().setBool('isLogin', true);
        getIt.get<SharedPreferences>().setString(
          'token',
          responseBody.userData?.token ?? '',
        );
        emit(LoginSuccess(responseBody));
      },
    );
  }
}
