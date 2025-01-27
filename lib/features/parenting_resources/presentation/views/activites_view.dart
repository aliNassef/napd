import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

import '../widgets/activites_view_body.dart';

class ActivitesView extends StatelessWidget {
  const ActivitesView({super.key});
  static const String routeName = 'activites';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Activites'),
      body: SafeArea(
        child: ActivitesViewBody(),
      ),
    );
  }
}
