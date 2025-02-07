import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/appbars/custom_app_bar.dart';

import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/shop/presentation/widgets/price_rating.dart';
import 'package:napd/features/shop/presentation/widgets/product_action_buttons.dart';
import 'package:napd/features/shop/presentation/widgets/product_description.dart';
import 'package:napd/features/shop/presentation/widgets/product_image.dart';
import 'package:napd/features/shop/presentation/widgets/product_title.dart';

class ProductDetailsView extends StatefulWidget {
  static const String routeName = '/productDetails';

  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'toys'.tr(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ProductImage(),
              VerticalSpace(16),
              // Seller Info
              Text(
                "${"seller".tr()} : Amazon",
                style: AppStyles.roboto16Regular.copyWith(
                  color: Colors.grey,
                ),
              ),
              VerticalSpace(8),
              // Product Title
              ProductTitle(),
              VerticalSpace(8),
              // Price and Rating
              PriceAndRating(),
              VerticalSpace(16),
              // Description
              ProductDescription(),
              VerticalSpace(16),
              // Action Buttons
              ProductActionButtons(),
              VerticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
