
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppSvgs.locationIcon,
          width: 12.w,
          height: 12.h,
        ),
        HorizantalSpace(4),
        Text(
          'Bandung',
          style: AppStyles.roboto10Regular.copyWith(color: Color(0xff999999)),
        ),
      ],
    );
  }
}
