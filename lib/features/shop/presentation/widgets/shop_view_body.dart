import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/spacers.dart';
import 'custom_carousel_slider.dart';
import 'shop_header.dart';
import 'shop_item.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              VerticalSpace(16),
              CustomSearchBar(
                vertivalPadding: 16,
              ),
              VerticalSpace(40),
            ],
          ).withHorizontalPadding(16),
        ),
        SliverToBoxAdapter(
          child: CustomCarouselSlider(),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              VerticalSpace(30),
              ShopHeader(
                title: 'newproducts'.tr(),
                subTitle: 'seeall'.tr(),
              ),
              VerticalSpace(12),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 216.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ShopItem();
              },
              separatorBuilder: (_, __) => HorizantalSpace(12),
              itemCount: 10,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              VerticalSpace(30),
              ShopHeader(
                title: 'clothes'.tr(),
                subTitle: 'seeall'.tr(),
              ),
              VerticalSpace(12),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 216.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ShopItem();
              },
              separatorBuilder: (_, __) => HorizantalSpace(12),
              itemCount: 10,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: VerticalSpace(20),
        )
      ],
    );
  }
}
