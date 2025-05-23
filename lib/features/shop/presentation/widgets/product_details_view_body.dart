import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import 'price_rating.dart';
import 'product_action_buttons.dart';
import 'product_description.dart';
import 'product_image.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(16),
        ProductImage(),
        VerticalSpace(16),
        Text(
          "${AppStrings.seller} : Amazon",
          style: AppStyles.roboto16Regular.copyWith(
            color: Colors.grey,
          ),
        ),
        VerticalSpace(8),
        Text(
          "Children's cube toy",
          style: AppStyles.roboto30Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(8),
        PriceAndRating(),
        VerticalSpace(16),
        ProductDescription(),
        VerticalSpace(30),
        ProductActionButtons(),
        VerticalSpace(16),
      ],
    ).withHorizontalPadding(16);
  }
}
