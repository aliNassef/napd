import 'package:flutter/material.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';
import '../widgets/tips_and_trick_view_body.dart';

class TipsAndTricksView extends StatelessWidget {
  const TipsAndTricksView({super.key});
  static const routeName = 'tips-and-tricks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tips & Tricks',
      ),
      body: SafeArea(
        child: TipsAndTricksViewBody(),
      ),
    );
  }
}
