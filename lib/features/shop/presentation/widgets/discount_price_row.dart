import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class DiscountPriceRow extends StatelessWidget {
  const DiscountPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 4.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Color(0xffF04438),
            ),
            color: Color(0xffffebe5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '50%',
            style: AppStyles.roboto10Regular.copyWith(
              color: Color(0xffF04438),
            ),
          ),
        ),
        HorizantalSpace(4),
        Text(
          'Rp150.000',
          style: AppStyles.roboto10Regular.copyWith(
            color: Color(0xff808080),
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
      ],
    );
  }
}
