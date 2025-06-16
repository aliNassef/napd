import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';

import '../widgets/routine_view_body.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});
  static const String routeName = 'routine_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RoutineViewBody().withHorizontalPadding(16),
      ),
    );
  }
}
