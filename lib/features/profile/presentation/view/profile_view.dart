import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.controller});
  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.profile,
        onLeadingTap: () {
          controller.index = 3;
        },
      ),
      body: SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
