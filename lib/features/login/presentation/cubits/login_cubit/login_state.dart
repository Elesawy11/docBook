import 'package:doc_book/features/login/data/models/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess({required LoginResopnseBody response}) = LoginSuccess;
  const factory LoginState.loginError({required String error}) = LoginError;
}
