import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_localizations.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/model/article_model.dart';

class ArticleDetailsViewBody extends StatelessWidget {
  const ArticleDetailsViewBody({
    super.key, required this.articleModel,
  });
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: CustomNetworkImage(
              img:
               articleModel.imageUrl,
              width: context.width,
              height: context.height * 2 / 5,
              fit: BoxFit.cover,
            ),
          ),
          backIconButton(context),
          Positioned(
            top: context.height * 2 / 5 - 40.h,
            child: Container(
              height: context.height * 3 / 5 + 40.h,
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: context.width * 1 / 6,
                      child: Divider(
                        color: Color(0xffDADADA),
                        thickness: 10,
                      ),
                    ),
                    VerticalSpace(20),
                    Text(
                articleModel.title,
                      style: AppStyles.roboto20Bold.copyWith(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    VerticalSpace(10),
                    _showTimeAndViews(),
                    VerticalSpace(40),
                    Text(
                      'Self-love and self-worth are essential for a happy and balanced life. When you value yourself, you build stronger relationships, improve your mental health, and grow personally. Signs of low self-worth include self-doubt, over-prioritizing others, and staying in toxic situations.',
                      style: AppStyles.roboto18Regular.copyWith(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    VerticalSpace(10),
                    _buildBulletPoint(
                      'Speak kindly to yourself with positive affirmations.',
                    ),
                    _buildBulletPoint(
                      'Speak kindly to yourself with positive affirmations.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned backIconButton(BuildContext context) {
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

  Row _showTimeAndViews() {
    return Row(
      spacing: 14.w,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppSvgs.clockIcon,
          height: 20.h,
          width: 20.w,
          colorFilter: ColorFilter.mode(
            AppColors.secondaryColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          '2hr ago',
          style: AppStyles.roboto11Regular.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        Icon(
          Icons.visibility_outlined,
          color: AppColors.secondaryColor,
          size: 17,
        ),
        Text(
          '360 views',
          style: AppStyles.roboto11Regular.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•  ',
            style: AppStyles.roboto18Regular.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppStyles.roboto18Regular.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
