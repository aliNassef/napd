import 'package:flutter/material.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';
import '../widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String routeName = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
      ),
      body: SettingsViewBody(),
    );
  }
}
