import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/baby_result_view_body.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

class BabyResultView extends StatelessWidget {
  static const String routeName = 'resultOfRecording';
  const BabyResultView({super.key});
  @override
  Widget build(BuildContext context) {
    // Sample data for predictions
    final predictions = [
      {'status': 'hungry'.tr(), 'percentage': 82},
      {'status': 'sleepy'.tr(), 'percentage': 18},
    ];

    return Scaffold(
      appBar: CustomAppBar(title: "result".tr()),
      body: SafeArea(
        child: BabyResultViewBody(predictions: predictions),
      ),
    );
  }
}
