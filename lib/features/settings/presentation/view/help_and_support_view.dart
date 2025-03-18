import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../widgets/help_and_support_view_body.dart';

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({super.key});
  static const routeName = 'help-and-support';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.helpAndSupport),
      body: SafeArea(
        child: HelpAndSupportViewBody(),
      ),
    );
  }
}
