
import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../data/model/product_model.dart';
import '../widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'productDetails';

  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.category,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ProductDetailsViewBody(product: product),
        ),
      ),
    );
  }
}
