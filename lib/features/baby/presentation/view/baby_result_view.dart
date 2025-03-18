import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/baby_result_view_body.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

class BabyResultView extends StatelessWidget {
  static const String routeName = 'resultOfRecording';
  const BabyResultView({super.key});
  @override
  Widget build(BuildContext context) {
    // Sample data for predictions
    final predictions = [
      {'status': AppStrings.hungry, 'percentage': 82},
      {'status': AppStrings.sleepy, 'percentage': 18},
    ];

    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.result),
      body: SafeArea(
        child: BabyResultViewBody(predictions: predictions),
      ),
    );
  }
}
