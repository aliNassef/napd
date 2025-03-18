import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/tips_and_trick_view_body.dart';

class TipsAndTricksView extends StatelessWidget {
  const TipsAndTricksView({super.key});
  static const routeName = 'tips-and-tricks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.tipsAndTricks,
      ),
      body: SafeArea(
        child: TipsAndTricksViewBody(),
      ),
    );
  }
}
