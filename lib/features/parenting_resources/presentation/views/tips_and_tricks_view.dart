import 'package:flutter/material.dart';
import '../widgets/tips_and_trick_view_body.dart';
import '../widgets/tips_and_tricks_app_bar.dart';
 
class TipsAndTricksView extends StatelessWidget {
  const TipsAndTricksView({super.key});
  static const routeName = 'tips-and-tricks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TipsAndTricksAppBar(),
      body: SafeArea(
        child: TipsAndTricksViewBody(),
      ),
    );
  }
}
