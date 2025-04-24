import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';

class PodcastsDetailsViewBody extends StatelessWidget {
  const PodcastsDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CustomNetworkImage(
            img:
                'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
            height: 450.h,
            width: 330.w,
          ),
        ),
        VerticalSpace(20),
        Text(
          "Talk on de-stressing with yoga | Relaxing",
          textAlign: TextAlign.center,
          style: AppStyles.roboto18Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(20),
        Slider(
          value: 0.6,
          onChanged: (value) {},
          activeColor: AppColors.darkBlueColor,
          inactiveColor: Colors.grey[300],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("15:00", style: TextStyle(color: Colors.grey)),
          ],
        ),
        VerticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_left,
                  size: 45, color: AppColors.darkBlueColor),
              onPressed: () {},
            ),
            HorizantalSpace(10),
            IconButton(
              icon: Icon(Icons.replay_10,
                  color: AppColors.darkBlueColor, size: 40),
              onPressed: () {},
            ),
            HorizantalSpace(20),
            CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              radius: 30,
              child: IconButton(
                icon: Icon(Icons.play_arrow,
                    color: AppColors.greyColor, size: 40),
                onPressed: () {},
              ),
            ),
            HorizantalSpace(10),
            IconButton(
              icon: Icon(Icons.forward_30,
                  color: AppColors.darkBlueColor, size: 40),
              onPressed: () {},
            ),
            HorizantalSpace(10),
            IconButton(
              icon: Icon(
                Icons.arrow_right,
                size: 45,
                color: AppColors.darkBlueColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ).withAllPadding(16);
  }
}
