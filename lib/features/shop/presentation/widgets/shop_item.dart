import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/product_model.dart';
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
    required this.product,
  });
  final ProductModel product;
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
              img: product.img,
              height: 200.h,
              width: 150.w,
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
                    product.title,
                    style: AppStyles.roboto14Medium.copyWith(
                      color: Color(0xff808080),
                    ),
                  ),
                  VerticalSpace(4),
                  Text(
                    '\$ ${product.price}',
                    style: AppStyles.roboto14SemiBold.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                  VerticalSpace(4),
                  Visibility(
                    visible: product.discount.isNotEmpty,
                    child: DiscountPriceRow(
                      discountPrice: product.discount,
                    ),
                  ),
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
