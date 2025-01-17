import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
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
                'Select baby account',
                style: AppStyles.roboto40Bold.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              VerticalSpace(40),
            ],
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, index) => BabyAccountItem(
            img: AppImages.boyAccount,
            name: 'Tamim',
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
