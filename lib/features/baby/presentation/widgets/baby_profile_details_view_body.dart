import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_localizations.dart';
import 'baby_info_content.dart';

class BabyProfileDetailsViewBody extends StatelessWidget {
  const BabyProfileDetailsViewBody({super.key, required this.baby});
  final BabyModel baby;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Stack(
        children: [
          CustomNetworkImage(
            img: baby.profilePicUrl ??
                'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
            height: context.height * 1 / 3,
            width: context.width,
          ),
          Positioned(
            top: context.height * 1 / 3 - 80,
            child: BabyInfoContent(
              babyModel: baby,
            ),
          ),
          _backIconButton(context),
        ],
      ),
    );
  }

  Positioned _backIconButton(BuildContext context) {
    return Positioned.directional(
      textDirection: injector<AppLocalizations>().isArabic(context)
          ? TextDirection.rtl
          : TextDirection.ltr,
      top: 40.h,
      start: 16.w,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.darkBlueColor,
          ),
        ),
      ),
    );
  }
}
