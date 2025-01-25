import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentOffer = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 150.h,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            // autoPlay: true,
            // autoPlayInterval: Duration(seconds: 3),
            // autoPlayAnimationDuration: Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              setState(() {
                currentOffer = index;
              });
            },
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            // enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 4,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Container(
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
            );
          },
        ),
        VerticalSpace(10),
        DotsIndicator(
          dotsCount: 4,
          position: currentOffer,
          decorator: const DotsDecorator(
            color: Color(0xffEAE8E8),
            size: Size.fromRadius(6),
            activeSize: Size.fromRadius(6),
            activeColor: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
