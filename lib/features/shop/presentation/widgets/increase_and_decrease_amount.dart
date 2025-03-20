import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class IncreaseAndDecreaseAmount extends StatefulWidget {
  const IncreaseAndDecreaseAmount({
    super.key,
  });

  @override
  State<IncreaseAndDecreaseAmount> createState() =>
      _IncreaseAndDecreaseAmountState();
}

class _IncreaseAndDecreaseAmountState extends State<IncreaseAndDecreaseAmount> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffEDEDED),
        border: Border.all(color: AppColors.primaryColor, width: 1.0),
      ),
      child: Row(
        spacing: 8.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Icon(
              Icons.add,
              color: AppColors.darkBlueColor,
            ),
          ),
          Text(
            count.toString(),
            style: AppStyles.roboto15SemiBold.copyWith(
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                count--;
              });
            },
            child: Icon(
              Icons.remove,
              color: AppColors.darkBlueColor,
            ),
          )
        ],
      ).withAllPadding(5),
    );
  }
}
