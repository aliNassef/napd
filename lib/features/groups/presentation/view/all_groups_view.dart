import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/all_groups_view_body.dart';

class AllGroupsView extends StatelessWidget {
  const AllGroupsView({super.key});
  static const routeName = 'all-groups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'groups'.tr()),
      body: SafeArea(
        child: AllGroupsViewBody(),
      ),
    );
  }
}
