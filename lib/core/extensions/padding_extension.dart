import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  Padding withHorizantalPadding(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding.w),
      );

  Padding withVerticalPadding(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding.h),
      );
}
