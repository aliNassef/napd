import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/baby/presentation/widgets/prediction_list.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/suggest_box.dart';

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

class BabyResultViewBody extends StatelessWidget {
  const BabyResultViewBody({
    super.key,
    required this.predictions,
  });

  final List<Map<String, dynamic>> predictions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalSpace(40),
          CircleAvatar(
            radius: 135,
            backgroundImage: AssetImage(AppImages.cryResult),
          ),
          VerticalSpace(8),
          BoxCryResult(),
          VerticalSpace(8),
          PredictionList(predictions: predictions),
          VerticalSpace(16),
          SuggestionBox(),
        ],
      ).withHorizontalPadding(8),
    );
  }
}

class BoxCryResult extends StatelessWidget {
  const BoxCryResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08),
        ),
        color: Color(0xffFFB8D5).withValues(alpha: 0.11),
      ),
      padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 21.h),
      child: Text(
        'I\'m Hungry',
        style: AppStyles.roboto20Regular.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
