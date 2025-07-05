import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';
import '../models/doctor_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<Either<ErrorHandler, List<DoctorModel>>> getAllDoctor() async {
    try {
      var response = await _apiService.getAllDoctor();
      final list = List.from(response['data'])
          .map((e) => DoctorModel.fromJson(e))
          .toList();
      return right(list);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
