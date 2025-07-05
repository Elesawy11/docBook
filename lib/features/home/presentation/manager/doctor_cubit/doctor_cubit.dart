import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/doctor_model.dart';
import '../../../data/repo/home_repo.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this._homeRepo) : super(DoctorInitial());

  final HomeRepo _homeRepo;
  List<DoctorModel> listOfDoctors = [];

  Future<void> getAllDoctor() async {
    emit(GetDoctorLoading());
    var response = await _homeRepo.getAllDoctor();

    response.fold(
        (failure) => emit(GetDoctorFailure(failure.apiErrorModel.message!)),
        (doctorsList) {
      listOfDoctors = doctorsList;
      emit(
        GetDoctorSuccess(
          doctorsList: doctorsList,
        ),
      );
    });
  }
}
