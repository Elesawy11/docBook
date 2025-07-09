import 'package:dio/dio.dart';
import 'package:doc_book/features/signup/data/models/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
part 'signup_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SignupSource {
  factory SignupSource(Dio dio, {String? baseUrl}) = _SignupSource;

  @POST(ApiConstants.signUp)
  Future<SignUpResponseModel> signup(
    @Body() Map<String,dynamic> data
  );
}
