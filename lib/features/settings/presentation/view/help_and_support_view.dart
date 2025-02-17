import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../widgets/help_and_support_view_body.dart';

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({super.key});
  static const routeName = 'help-and-support';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'helpandsupport'.tr()),
      body: SafeArea(
        child: HelpAndSupportViewBody(),
      ),
    );
  }
}
