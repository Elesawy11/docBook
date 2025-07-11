import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_doctor_item.dart';

class MyAppointmentUpcomingWidget extends StatelessWidget {
  const MyAppointmentUpcomingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<DoctorCubit>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: cubit.listOfDoctors.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomDoctorItem(
                doctorModel: cubit.listOfDoctors[index],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: const Divider(
                  thickness: 0.2,
                  color: ColorManager.grey9E,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: Colors.white,
                        border: Border.all(
                          color: ColorManager.mainBlue,
                        )),
                    width: 148.w,
                    height: 38.h,
                    child: Center(
                      child: Text(
                        'Cancel Appointment',
                        style: Styles.font12Regular.copyWith(
                          fontWeight: FontWeightHelper.semiBold,
                          color: ColorManager.mainBlue,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: ColorManager.mainBlue,
                    ),
                    width: 148.w,
                    height: 38.h,
                    child: Center(
                      child: Text(
                        'Reschedule',
                        style: Styles.font12Regular.copyWith(
                          fontWeight: FontWeightHelper.semiBold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
            ],
          );
        },
      ),
    );
  }
}

// any thing to commit