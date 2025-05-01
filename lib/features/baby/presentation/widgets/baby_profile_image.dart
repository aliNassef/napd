import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/image_picker_helper.dart';
import '../../../../core/utils/app_images.dart';

class BabyProfileImage extends StatelessWidget {
  const BabyProfileImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: CachedNetworkImageProvider(
            image,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              ImagePickerHelper.openImagePicker(
                onGet: (imageFile) {},
                context: context,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffAE6CAC),
                  width: 1,
                ),
              ),
              child: SvgPicture.asset(
                AppSvgs.edit2Icon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
