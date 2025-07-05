import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<Either<ErrorHandler, LoginResopnseBody>> login(
      LoginRequestBody loginRequest) async {
    try {
      var response = await _apiService.login(loginRequest);

      return right(
        LoginResopnseBody.fromJson(
          response,
        ),
      );
    } catch (e) {
      return left(
        ErrorHandler.handle(e),
      );
    }
  }
}
