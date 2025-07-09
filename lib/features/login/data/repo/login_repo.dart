import 'package:doc_book/core/networking/api_result.dart';
import 'package:doc_book/features/login/data/source/login_source.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class LoginRepoImpl {
  final LoginSource _source;

  LoginRepoImpl(this._source);

  Future<ApiResult<LoginResopnseBody>> login({
    required LoginRequestBody data,
  }) async {
    try {
      final response = await _source.login(data.toJson());

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e.toString()));
    }
  }
}
