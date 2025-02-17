import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/widgets/read_more_text.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "description".tr(),
          style: AppStyles.roboto18SemiBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        VerticalSpace(8),
        ReadMoreText(
          text:
              'Vegan, Non-GMO, Gluten-free & Gelatin-free: Each bottle of Goli contains 60 delicious, vegan, non-gmo, gluten-free & gelatin-free Apple Cider Vinegar gummies, which makes them suitable for almost any lifestyle.',
          maxLines: 3,
        ),
      ],
    );
  }
}
