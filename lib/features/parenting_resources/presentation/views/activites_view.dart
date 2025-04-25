import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/features/parenting_resources/presentation/cubits/activity_cubit/activity_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../widgets/activites_view_body.dart';

class ActivitesView extends StatelessWidget {
  const ActivitesView({super.key});
  static const String routeName = 'activites';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.activites),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<ActivityCubit>()..getActivities(),
          child: ActivitesViewBody(),
        ),
      ),
    );
  }
}
