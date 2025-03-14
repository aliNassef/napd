import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'productDetails';

  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'toys'.tr(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ProductDetailsViewBody(),
        ),
      ),
    );
  }
}
