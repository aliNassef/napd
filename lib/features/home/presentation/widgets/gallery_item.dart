import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/features/home/data/model/gallrey_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    super.key,
    required this.gallrey,
  });
  final GallreyModel gallrey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CustomNetworkImage(
            img: gallrey.imageUrl,
            width: 180.w,
            height: 164.h,
          ),
        ),
        VerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              gallrey.createdAt.split(' ')[0],
              style: AppStyles.roboto18Medium.copyWith(
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
