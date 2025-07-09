import 'package:dio/dio.dart';
import 'package:doc_book/core/networking/api_constants.dart';
import 'package:doc_book/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'login_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginSource {
  factory LoginSource(Dio dio, {String? baseUrl}) = _LoginSource;

  @POST(ApiConstants.login)
  Future<LoginResopnseBody> login(
    @Body() Map<String,dynamic> data
  );
}
