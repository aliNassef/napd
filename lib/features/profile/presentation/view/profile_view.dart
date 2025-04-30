import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../../../../core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
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
      body: BlocProvider(
        create: (context) =>
            injector<GetMotherProfileCubit>()..getMotherProfile(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ProfileViewBody().withHorizontalPadding(16),
          ),
        ),
      ),
    );
  }
}
