
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_images.dart';
import 'social_media_item.dart';

class SocialMediaListItems extends StatelessWidget {
  const SocialMediaListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SocialMediaItem(img: AppSvgs.faceIcon),
          SocialMediaItem(img: AppSvgs.googleIcon),
          SocialMediaItem(img: AppSvgs.appleIcon),
        ],
      ),
    );
  }
}
