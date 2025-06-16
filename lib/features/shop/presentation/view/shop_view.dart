import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/features/shop/presentation/get_product_cubit/get_products_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static const routeName = 'shop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.shop,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<GetProductsCubit>()..getProducts(),
          child: ShopViewBody().withHorizontalPadding(16),
        ),
      ),
    );
  }
}
