import 'package:flutter/material.dart';
import 'package:napd/core/widgets/background_widget.dart';

import '../widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});
  static const routeName = 'start';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: StartViewBody(),
        ),
      ),
    );
  }
}
