import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:napd/core/helpers/image_picker_helper.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: CachedNetworkImageProvider(
            'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              ImagePickerHelper.openImagePicker(
                  onGet: (imageFile) {}, context: context);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.darkBlueColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppSvgs.editIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
