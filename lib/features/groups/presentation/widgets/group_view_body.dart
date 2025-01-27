import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import 'group_item.dart';

import 'featured_group_item.dart';

class GroupViewBody extends StatelessWidget {
  const GroupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(30),
                  Text(
                    'My groups',
                    style: AppStyles.roboto24Bold.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                  VerticalSpace(30),
                ],
              ),
            ),
            SliverList.separated(
              itemBuilder: (_, index) => GroupItem(),
              separatorBuilder: (context, index) => VerticalSpace(30),
              itemCount: 3,
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(30),
                  Text(
                    'Featured groups',
                    style: AppStyles.roboto24Bold.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                  VerticalSpace(30),
                ],
              ),
            ),
            SliverList.separated(
              itemBuilder: (_, index) => FeaturedGroupItem(),
              separatorBuilder: (context, index) => VerticalSpace(23),
              itemCount: 3,
            ),
            SliverToBoxAdapter(
              child: VerticalSpace(16),
            ),
          ],
        ),
      ),
    );
  }
}
