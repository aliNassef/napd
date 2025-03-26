import 'package:flutter/material.dart';

import '../widgets/thanks_view_body.dart';

class ThanksView extends StatelessWidget {
  static const String routeName = 'thanks';
  const ThanksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: ThanksViewBody()),
      ),
    );
  }
}
