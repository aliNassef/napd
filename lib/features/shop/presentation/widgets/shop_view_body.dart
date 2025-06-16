import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/shop/data/model/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/spacers.dart';
import '../get_product_cubit/get_products_cubit.dart';
import '../view/product_details_view.dart';
import 'shop_item.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverToBoxAdapter(
        //   child: Column(
        //     children: [
        //       VerticalSpace(16),
        //       CustomSearchBar(
        //         vertivalPadding: 16,
        //       ),
        //       VerticalSpace(40),
        //     ],
        //   ).withHorizontalPadding(16),
        // ),
        // SliverToBoxAdapter(
        //   child: ShopOffersItems(),
        // ),
        // SliverToBoxAdapter(
        //   child: Column(
        //     children: [
        //       VerticalSpace(30),
        //       ShopHeader(
        //         title: AppStrings.newProducts,
        //         subTitle: AppStrings.seeAll,
        //       ),
        //       VerticalSpace(12),
        //     ],
        //   ),
        // ),
        SliverToBoxAdapter(
          child: VerticalSpace(20),
        ),
        BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsSuccess) {
              return SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailsView.routeName,
                        arguments: state.products[index],
                      );
                    },
                    child: ShopItem(
                      product: state.products[index],
                    ),
                  );
                },
                itemCount: state.products.length,
              );
            }
            if (state is GetProductsFailure) {
              return SliverToBoxAdapter(
                child: CustomFailureWidget(errMessage: state.failure),
              );
            }
            if (state is GetProductsLoading) {
              return SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (_, index) {
                  return Skeletonizer(
                    enabled: true,
                    child: ShopItem(
                        product: ProductModel(
                      id: 'aa',
                      title: 'Ali Nassef',
                      price: '100',
                      stars: '4',
                      img:
                          'https://th.bing.com/th/id/OIP.QTWycrcxlEBEBRRgll5YqAHaLH?rs=1&pid=ImgDetMain&cb=idpwebpc1',
                      description: 'assfav,lsv',
                      url: 'https://www.google.com',
                      category: 'clothes',
                      discount: '10',
                    )),
                  );
                },
                itemCount: 4,
              );
            }

            return const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            );
          },
        ),

        // SliverToBoxAdapter(
        //   child: Column(
        //     children: [
        //       VerticalSpace(30),
        //       ShopHeader(
        //         title: AppStrings.clothes,
        //         subTitle: AppStrings.seeAll,
        //       ),
        //       VerticalSpace(12),
        //     ],
        //   ),
        // ),
        // SliverToBoxAdapter(
        //   child: VerticalSpace(20),
        // )
      ],
    );
  }
}
