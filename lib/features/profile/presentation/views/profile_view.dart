import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.mainBlue,
      body: SafeArea(child: ProfileViewBody()),
    );
  }
}
