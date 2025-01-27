import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/tips_and_trick_view_body.dart';

class TipsAndTricksView extends StatelessWidget {
  const TipsAndTricksView({super.key});
  static const routeName = 'tips-and-tricks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'tipsandtricks'.tr(),
      ),
      body: SafeArea(
        child: TipsAndTricksViewBody(),
      ),
    );
  }
}
