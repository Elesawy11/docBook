import 'package:dio/dio.dart';
import 'package:doc_book/core/utils/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/data/models/login_request.dart';
import '../../features/signup/data/models/sign_up_request_model.dart';

import 'api_constants.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  // Future<Map<String, dynamic>> login(LoginRequestBody loginRequest) async {
  //   var response = await dio.post(
  //     '${ApiConstants.apiBaseUrl}${ApiConstants.login}',
  //     data: {'email': loginRequest.email, 'password': loginRequest.password},
  //   );
  //   return response.data;
  // }

  // Future<Map<String, dynamic>> signUp(SignUpRequestModel signUpRequest) async {
  //   var response = await dio.post(
  //     '${ApiConstants.apiBaseUrl}${ApiConstants.signUp}',
  //     data: {
  //       'name': signUpRequest.name,
  //       'email': signUpRequest.email,
  //       'phone': signUpRequest.phone,
  //       'gender': signUpRequest.gender,
  //       'password': signUpRequest.password,
  //       'password_confirmation': signUpRequest.passwordConfirmation,
  //     },
  //   );
  //   return response.data;
  // }

  Future<Map<String, dynamic>> getAllDoctor() async {
    final token = getIt.get<SharedPreferences>().getString('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await dio.get(
      '${ApiConstants.apiBaseUrl}${ApiConstants.getAllDoctor}',
      options: Options(headers: headers),
    );
    return response.data;
  }
}
