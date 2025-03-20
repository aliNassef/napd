import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../layout/presentation/view/layout_view.dart';
import 'baby_account_item.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class SelectBabyAccountViewBody extends StatelessWidget {
  const SelectBabyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              VerticalSpace(40),
              Text(
                AppStrings.selectBabyAccount,
                style: AppStyles.roboto40Bold.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              VerticalSpace(40),
            ],
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LayoutView.routeName);
            },
            child: BabyAccountItem(
              img: AppImages.boyAccount,
              name: 'Tamim',
            ),
          ),
          separatorBuilder: (_, index) => VerticalSpace(40),
          itemCount: 3,
        ),
      ],
    );

    //   return Column(
    //     children: [

    //       Expanded(
    //         child:
    //       ),
    //     ],
    //   );
    // }
  }
}
