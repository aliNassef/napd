import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:napd/features/groups/data/model/video_model.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../view/video_player_view.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.video, this.image});
  final VideoModel video;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          VideoPlayerView.routeName,
          arguments: video,
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image ?? AppImages.dummyImage1,
              height: 133.h,
              width: 166.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Color(0xff5C6898).withValues(alpha: 0.6),
              ),
              child: Text(
                video.title,
                style: AppStyles.roboto14Regular.copyWith(
                  color: Color(0xfff5f5f5),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: SvgPicture.asset(
                AppSvgs.videoPlayerIcon,
                height: 35.h,
                width: 35.w,
              ),
            ),
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
