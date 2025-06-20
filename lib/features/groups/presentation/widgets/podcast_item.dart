import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

 import '../../data/model/podcast_model.dart';

class PodcastItem extends StatelessWidget {
  const PodcastItem({super.key, required this.audio, this.image});
  final PodcastModel audio;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.asset(
            image!,
            width: 120.w,
            height: 200.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.darkBlueColor.withValues(alpha: 0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            child: Text(
              audio.title,
              style: AppStyles.roboto14Regular.copyWith(
                color: Color(0xfff5f5f5),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Icon(
            Icons.mic,
            color: AppColors.darkBlueColor,
          ),
        )
      ],
    );
  }
}
