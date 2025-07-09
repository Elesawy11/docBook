import 'package:doc_book/core/networking/api_error_handler.dart';
import 'package:doc_book/core/networking/api_result.dart';
import 'package:doc_book/features/signup/data/models/sign_up_request_model.dart';
import 'package:doc_book/features/signup/data/models/sign_up_response_model.dart';
import 'package:doc_book/features/signup/data/source/signup_source.dart';

class SignUpRepo {
  final SignupSource _source;

  SignUpRepo(this._source);

  Future<ApiResult<SignUpResponseModel>> signup({
    required SignUpRequestModel data,
  }) async {
    try {
      final response = await _source.signup(data.toJson());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e.toString()));
    }
  }
}
