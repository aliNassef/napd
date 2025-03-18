import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_strings.dart';
import '../view/all_groups_view.dart';
import 'header_with_see_all.dart';
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
                  HeaderWithSeeAll(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        AllGroupsView.routeName,
                      );
                    },
                    title: AppStrings.myGroups,
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
                  HeaderWithSeeAll(
                    title: AppStrings.featuredGroups,
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
