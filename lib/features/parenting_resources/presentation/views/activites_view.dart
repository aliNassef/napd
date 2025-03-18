import 'package:flutter/material.dart';
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
        child: ActivitesViewBody(),
      ),
    );
  }
}
