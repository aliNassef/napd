import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/all_groups_view_body.dart';

class AllGroupsView extends StatelessWidget {
  const AllGroupsView({super.key});
  static const routeName = 'all-groups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.groups),
      body: SafeArea(
        child: AllGroupsViewBody(),
      ),
    );
  }
}
