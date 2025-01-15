import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/spacers.dart';
import 'tip_item.dart';
class TipsAndTricksViewBody extends StatelessWidget {
  const TipsAndTricksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemCount: 10,
      itemBuilder: (context, index) {
        return TipItem();
      },
      separatorBuilder: (context, index) {
        return VerticalSpace(28);
      },
    );
  }
}
