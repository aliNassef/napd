import 'package:flutter/material.dart';
import 'package:napd/features/settings/presentation/widgets/settings_top_bar.dart';

import '../widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String routeName = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: SettingsViewBody(),
    );
  }
}
