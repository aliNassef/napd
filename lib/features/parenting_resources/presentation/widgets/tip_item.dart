import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/features/parenting_resources/data/models/tips_trics_model.dart';
import '../../../../core/utils/app_shadows.dart';

import 'tip_item_content.dart';
class TipItem extends StatelessWidget {
  const TipItem({
    super.key, required this.tipsAndTricksModel, required this.index,
  });
  final TipsAndTricksModel tipsAndTricksModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
        AppShadows.shadow4,
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w , vertical:  16.h),
      child: TipItemContent(
        image: tipsAndTricksModel.imagePath,
         title:tipsAndTricksModel.title,
         points : tipsAndTricksModel.tips,
       ),
    );
  }
}
