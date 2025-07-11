import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import 'specialist_item.dart';

class CustomSpecialistListView extends StatelessWidget {
  const CustomSpecialistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      child: ListView.builder(
        itemCount: specialistDoctorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SpecialistItem(
            specialistDoctorList: specialistDoctorList[index],
          );
        },
      ),
    );
  }
}
