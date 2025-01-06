import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';

import '../utils/app_images.dart';
import 'social_media_item.dart';

class SocialMediaListItems extends StatelessWidget {
  const SocialMediaListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaItem(img: AppSvgs.faceIcon),
        SocialMediaItem(img: AppSvgs.googleIcon),
        SocialMediaItem(img: AppSvgs.appleIcon),
      ],
    ).withHorizontalPadding(16);
  }
}
