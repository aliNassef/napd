import 'dart:math' as math;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';

class ShopOffersItems extends StatefulWidget {
  const ShopOffersItems({
    super.key,
  });

  @override
  State<ShopOffersItems> createState() => _ShopOffersItemsState();
}

class _ShopOffersItemsState extends State<ShopOffersItems> {
  final ValueNotifier<int> _currentOffer = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 376 / 150,
          child: CarouselSlider.builder(
            options: _buildCarouselOptions(),
            itemCount: 4,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.secondaryColor,
                      AppColors.primaryColor,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildOfferDetails(),
                    ),
                    Expanded(child: _buildOfferImage()),
                  ],
                ),
              );
            },
          ),
        ),
        VerticalSpace(10),
        ValueListenableBuilder<int>(
          valueListenable: _currentOffer,
          builder: (context, value, child) => DotsIndicator(
            dotsCount: 4,
            position: value,
            decorator: const DotsDecorator(
              color: Color(0xffEAE8E8),
              size: Size.fromRadius(6),
              activeSize: Size.fromRadius(6),
              activeColor: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }

  Column _buildOfferDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Transform.rotate(
              angle: -math.pi / 2,
              child: Text(
                'Upto',
                style: AppStyles.roboto11Bold.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ),
            Text(
              '80%',
              style: AppStyles.roboto32Bold.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            HorizantalSpace(6),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Offer',
                style: AppStyles.roboto11Bold.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ],
        ),
        Text(
          'On Health Products',
          style: AppStyles.roboto11Bold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        Spacer(),
        _buildShopNowButton(),
        Expanded(
          child: FittedBox(
            child: Text(
              'Homeopathy, Ayurvedic, Personal Care & More',
              style: AppStyles.roboto10Regular.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildOfferImage() {
    return Align(
      alignment: Alignment.centerRight,
      child: CircleAvatar(
        radius: 62,
        backgroundColor: AppColors.greenLightColor,
      ),
    );
  }

  TextButton _buildShopNowButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.darkBlueColor,
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
          horizontal: 12.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Shop Now',
        style: AppStyles.roboto10SemiBold.copyWith(
          fontWeight: FontWeight.w800,
          color: AppColors.greyColor,
        ),
      ),
    );
  }

  CarouselOptions _buildCarouselOptions() {
    return CarouselOptions(
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      // autoPlay: true,
      // autoPlayInterval: Duration(seconds: 3),
      // autoPlayAnimationDuration: Duration(milliseconds: 800),
      onPageChanged: (index, reason) {
        _currentOffer.value = index;
      },
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
  }

  @override
  void dispose() {
    _currentOffer.dispose();
    super.dispose();
  }
}
