import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';
import 'discount_price_row.dart';
import 'location_row.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          AppShadows.shadow7,
          AppShadows.shadow8,
        ],
      ),
      child: Stack(
        fit: StackFit.loose,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomNetworkImage(
              fit: BoxFit.cover,
              img:
                  'https://r2.starryai.com/results/1042152870/6eb099de-74c0-460b-900e-551a3e7c540f.webp',
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'data',
                    style: AppStyles.roboto14Medium.copyWith(
                      color: Color(0xff808080),
                    ),
                  ),
                  VerticalSpace(4),
                  Text(
                    '\$ 75.000',
                    style: AppStyles.roboto14SemiBold.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                  VerticalSpace(4),
                  Visibility(child: DiscountPriceRow()),
                  VerticalSpace(4),
                  LocationRow(),
                ],
              ).withHorizontalPadding(8).withVerticalPadding(5),
            ),
          ),
        ],
      ),
    );
  }
}
