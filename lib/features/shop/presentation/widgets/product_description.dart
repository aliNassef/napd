import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "description".tr(),
            style: AppStyles.roboto18SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                'Vegan, Non-GMO, Gluten-free & Gelatin-free: Each bottle of Goli contains 60 delicious, vegan, non-gmo, gluten-free & gelatin-free Apple Cider Vinegar gummies, which makes them suitable for almost any lifestyle.',
                style: AppStyles.roboto14Regular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
