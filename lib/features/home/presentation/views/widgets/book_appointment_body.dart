import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../data/models/doctor_model.dart';
import 'book_phase_widget.dart';
import 'booking_information_widget.dart';
import 'custom_payment_widget.dart';
import 'date_and_time_widget.dart';

class BookAppointmentBody extends StatefulWidget {
  const BookAppointmentBody({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  State<BookAppointmentBody> createState() => _BookAppointmentBodyState();
}

class _BookAppointmentBodyState extends State<BookAppointmentBody>
    with TickerProviderStateMixin {
  late PageController pageViewController;
  int currentPageIndex = 0;
  int currentDate = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBarWidget(
          text: 'Book Appointment',
        ),
        verticalSpace(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SizedBox(
            height: 53.h,
            child: ListView.builder(
              itemCount: phasesList.length,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return BookPhaseWidget(
                  number: phasesList[index][0],
                  text: phasesList[index][1],
                  textColor: currentPageIndex > index
                      ? ColorManager.green
                      : ColorManager.darkBlue,
                  color: currentPageIndex == index
                      ? ColorManager.mainBlue
                      : currentPageIndex > index
                          ? ColorManager.green
                          : ColorManager.grey75,
                );
              },
            ),
          ),
        ),
        verticalSpace(24),
        Container(
          constraints: BoxConstraints(
            minHeight: 379.h,
            maxHeight: 640.h,
            maxWidth: 329.w,
            minWidth: 329.w,
          ),
          child: PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              currentPageIndex = value;
              setState(() {});
            },
            controller: pageViewController,
            children: [
              const DateAndTimeWidget(),
              const CustomPaymentWidget(),
              BookingInformationWidget(widget: widget)
            ],
          ),
        ),
        const Spacer(),
        AppTextButton(
          text: currentPageIndex == phasesList.length - 1
              ? 'Book Now'
              : 'Continue',
          onPressed: () {
            pageViewController.nextPage(
                duration: const Duration(microseconds: 30),
                curve: Curves.bounceInOut);
            if (currentPageIndex == phasesList.length - 1) {
              context.push(
                  '${Routes.recommendationView}/${Routes.bookingAppointmentDetails}');
            }
          },
        ),
        const Spacer()
      ],
    );
  }
}
