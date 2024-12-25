import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'tip_item_content.dart';
class TipItem extends StatelessWidget {
  const TipItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
