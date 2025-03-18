import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_strings.dart';
import '../../../parenting_resources/presentation/views/activites_view.dart';
import '../../../parenting_resources/presentation/views/recipes_view.dart';
import '../../../../core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../baby/presentation/view/cry_translator_view.dart';
import 'feature_item.dart';

class HomeFeatures extends StatelessWidget {
  const HomeFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 45.h),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.cryIcon,
            text: AppStrings.cryTranslation,
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                CryTranslatorView.routeName,
              );
            },
          ),
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.recipesIcon,
            text: AppStrings.recipes,
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                RecipesView.routeName,
              );
            },
          ),
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.activitesIcon,
            text: AppStrings.activities,
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                ActivitesView.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
