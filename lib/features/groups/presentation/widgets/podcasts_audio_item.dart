import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:napd/features/groups/data/model/podcast_model.dart';
import 'package:napd/features/groups/presentation/view/podcasts_details_view.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class PodcastsAudioItem extends StatelessWidget {
  const PodcastsAudioItem({super.key, required this.audio});
  final PodcastModel audio;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PodcastsDetailsView.routeName,
            arguments: audio);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [AppShadows.shadow6],
        ),
        padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                AppImages.podcastDemo,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            HorizantalSpace(12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 10.h,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(4),
                        Text(
                          audio.title,
                          style: AppStyles.roboto18Medium.copyWith(
                            color: AppColors.darkBlueColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppSvgs.clockIcon,
                              width: 20.w,
                              height: 20.h,
                            ),
                            HorizantalSpace(6),
                            Text(
                              audio.duration,
                              style: AppStyles.roboto12Regular.copyWith(
                                color: Color(0xff808080),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppSvgs.playIcon,
                    width: 20.w,
                    height: 20.h,
                  ).withHorizontalPadding(8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
