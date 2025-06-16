import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/widgets/read_more_text.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.description});
  final String description;

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
          AppStrings.description,
          style: AppStyles.roboto18SemiBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        VerticalSpace(8),
        ReadMoreText(
          text: widget.description,
          maxLines: 3,
        ),
      ],
    );
  }
}
