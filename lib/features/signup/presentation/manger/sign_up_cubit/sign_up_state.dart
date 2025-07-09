import 'package:doc_book/features/signup/data/models/sign_up_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess({required SignUpResponseModel response}) = SignupSuccess;
  const factory SignupState.signupError({required String error}) = SignupError;
}
