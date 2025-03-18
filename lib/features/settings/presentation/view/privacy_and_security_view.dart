import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/privacy_and_security_view_body.dart';

class PrivacyAndSecurityView extends StatelessWidget {
  const PrivacyAndSecurityView({super.key});
  static const routeName = 'privacy-and-security';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.privacyAndSecurity,
      ),
      body: SafeArea(
        child: PrivacyAndSecurityViewBody(),
      ),
    );
  }
}
