import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(img),
    );
  }
}
