import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_doctor_item.dart';

class MyAppointmentCompletedWidget extends StatelessWidget {
  const MyAppointmentCompletedWidget({
    super.key,
    required this.mainText,
    this.color,
  });
  final String mainText;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<DoctorCubit>();
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SizedBox(
                width: 344.w,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorManager.grayED,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          mainText,
                          style: Styles.font12Regular.copyWith(
                            color: color ?? Colors.green,
                          ),
                        ),
                        subtitle: Text(
                          'Wed, 17 May | 08.30 AM',
                          style: Styles.font12Regular.copyWith(
                            color: ColorManager.grey61,
                          ),
                        ),
                        trailing: Icon(
                          Icons.more_vert,
                          size: 24.r,
                          color: ColorManager.grey9E,
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    CustomDoctorItem(
                      doctorModel: cubit.listOfDoctors[index],
                    )
                  ],
                ),
              );
            },
            itemCount: cubit.listOfDoctors.length,
          ),
        ),
      ],
    );
  }
}
