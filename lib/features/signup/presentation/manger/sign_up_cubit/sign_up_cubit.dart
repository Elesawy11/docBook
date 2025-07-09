import 'package:bloc/bloc.dart';
import 'package:doc_book/core/networking/api_result.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/sign_up_request_model.dart';
import '../../../data/models/sign_up_response_model.dart';
import '../../../data/repo/sign_up_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit(this._repo) : super(SignupState.initial());
  final SignUpRepo _repo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    emit(SignupState.signupLoading());

    var response = await _repo.signup(
      data: SignUpRequestModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );

    switch (response) {
      case Success():
        emit(SignupState.signupSuccess(response: response.data));

        break;
      case Failure():
        emit(
          SignupState.signupError(
            error:
                response.errorHandler.apiErrorModel.message ?? 'Unkwon error',
          ),
        );
    }
  }
}
