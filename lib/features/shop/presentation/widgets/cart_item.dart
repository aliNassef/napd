import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_shadows.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/custom_network_image.dart';
import 'package:napd/core/widgets/spacers.dart';

import 'increase_and_decrease_amount.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppShadows.shadow5,
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 9.h,
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomNetworkImage(
              img: 'https://i.chzbgr.com/full/9836262144/h2E0CB29F',
              height: 75.h,
              width: 82.w,
              fit: BoxFit.fill,
            ),
          ),
          HorizantalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baby car",
                style: AppStyles.roboto20SemiBold.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
              Text(
                "Brand: Goli",
                style: AppStyles.roboto14Regular.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
              Text(
                "\$16.99",
                style: AppStyles.roboto18Regular.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
            ],
          ),
          Spacer(),
          IncreaseAndDecreaseAmount(),
        ],
      ),
    );
  }
}
