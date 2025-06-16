import 'package:flutter/material.dart';
import 'package:napd/core/functions/show_error_message.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/model/product_model.dart';
import 'price_rating.dart';
import 'product_description.dart';
import 'product_image.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(16),
        ProductImage(img: product.img),
        VerticalSpace(16),
        Text(
          "${AppStrings.seller} : Amazon",
          style: AppStyles.roboto16Regular.copyWith(
            color: Colors.grey,
          ),
        ),
        VerticalSpace(8),
        Text(
          product.title,
          style: AppStyles.roboto30Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(8),
        PriceAndRating(
          price: product.price,
          rating: product.stars,
        ),
        VerticalSpace(16),
        ProductDescription(
          description: product.description,
        ),
        VerticalSpace(30),
        DefaultAppButton(
          text: AppStrings.checkout,
          onPressed: () async => await _launchUrl(context, product.url),
          backgroundColor: AppColors.darkBlueColor,
          textColor: Colors.white,
        ),
        VerticalSpace(16),
      ],
    ).withHorizontalPadding(16);
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    if (!await launchUrl(Uri.parse(url))) {
     showErrorMessage(context, errMessage: 'Could not launch $url');
    }
  }
}
