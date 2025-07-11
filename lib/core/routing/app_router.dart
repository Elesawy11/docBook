import 'package:doc_book/features/login/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:doc_book/features/signup/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../app_home.dart';
import '../../features/chat/presentation/views/chat_view.dart';
import '../../features/chat/presentation/views/messages_view.dart';
import '../../features/home/data/models/doctor_model.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import '../../features/home/presentation/views/book_appointment_view.dart';
import '../../features/home/presentation/views/booking_appointment_details.dart';
import '../../features/home/presentation/views/calender_view.dart';
import '../../features/home/presentation/views/doctor_details.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/home/presentation/views/recommendation_view.dart';
import '../../features/home/presentation/views/speciality_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/my_appointment/presentation/views/my_appointment_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/profile/presentation/views/f_a_q_view.dart';
import '../../features/profile/presentation/views/language_view.dart';
import '../../features/profile/presentation/views/medical_records_view.dart';
import '../../features/profile/presentation/views/payment_view.dart';
import '../../features/profile/presentation/views/personal_info_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/security_view.dart';
import '../../features/profile/presentation/views/setting_notification_view.dart';
import '../../features/profile/presentation/views/setting_view.dart';
import '../../features/signup/presentation/views/signup_view.dart';
import '../utils/service_locator.dart';
import 'routes.dart';

abstract class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.onboardingView,
    // redirect: (context, state) async {
    //   final SharedPreferences pref = await SharedPreferences.getInstance();
    //   if (pref.getBool('isLogin') ?? false) {
    //     return Routes.chatView;
    //   } else {
    //     return Routes.onboardingView;
    //   }
    // },
    routes: [
      GoRoute(
        path: Routes.onboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppHome(navigationshell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.homeView,
                builder: (context, state) => BlocProvider(
                  create: (context) => getIt.get<DoctorCubit>(),
                  child: const HomeView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.messagesView,
                builder: (context, state) => const MessagesView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.myAppointmentView,
                builder: (context, state) => BlocProvider(
                  create: (context) =>
                      DoctorCubit(getIt.get<HomeRepo>())..getAllDoctor(),
                  child: const MyAppointmentView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profileView,
                builder: (context, state) => const ProfileView(),
                routes: [
                  GoRoute(
                    path: Routes.settingView,
                    builder: (context, state) => const SettingView(),
                  ),
                  GoRoute(
                    path: Routes.settingNotificationView,
                    builder: (context, state) =>
                        const SettingNotificationView(),
                  ),
                  GoRoute(
                    path: Routes.fAQView,
                    builder: (context, state) => const FAQView(),
                  ),
                  GoRoute(
                    path: Routes.securityView,
                    builder: (context, state) => const SecurityView(),
                  ),
                  GoRoute(
                    path: Routes.languageView,
                    builder: (context, state) => const LanguageView(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.loginView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: Routes.signupView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<SignUpCubit>(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: Routes.specialityView,
        builder: (context, state) => const SpecialityView(),
      ),
      GoRoute(
        path: Routes.notificationView,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: Routes.recommendationView,
        builder: (context, state) => const RecommendationView(),
        routes: [
          GoRoute(
            path: Routes.doctorDetailsView,
            builder: (context, state) =>
                DoctorDetailsView(doctorModel: state.extra as DoctorModel),
          ),
          GoRoute(
            path: Routes.bookAppointmentView,
            builder: (context, state) =>
                BookAppointmentView(doctorModel: state.extra as DoctorModel),
          ),
          GoRoute(
            path: Routes.bookingAppointmentDetails,
            builder: (context, state) => const BookingAppointmentDetails(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.chatView,
        builder: (context, state) => const ChatView(),
      ),
      GoRoute(
        path: Routes.personalInfoView,
        builder: (context, state) => const PersonalInfoView(),
      ),
      GoRoute(
        path: Routes.medicalRecordesView,
        builder: (context, state) => const MedicalRecordesView(),
      ),
      GoRoute(
        path: Routes.paymentView,
        builder: (context, state) => const PaymentView(),
      ),
    ],
  );
}
