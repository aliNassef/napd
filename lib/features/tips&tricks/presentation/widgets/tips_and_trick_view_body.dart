import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:napd/core/widgets/spacers.dart';
import 'tip_item_content.dart';

class TipsAndTricksViewBody extends StatelessWidget {
  const TipsAndTricksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w , vertical:  16.h),
          child: TipItemContent(
            tipNumber: '1',
            title: 'Tips for comfy Sleeping',
            points: [
              'Use a comfortable mattress and pillows',
              'Read a book or listen to soothing music to help yourself fall asleep',
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return VerticalSpace(28);
      },
    );
  }
}
