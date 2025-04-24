import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/widgets/custom_check_box.dart';

class BabyGenderSelector extends StatefulWidget {
  const BabyGenderSelector({super.key, this.onChanged});
  // Change to int to represent gender (0 for girl, 1 for boy)
  final ValueChanged<int>? onChanged;
  @override
  // ignore: library_private_types_in_public_api
  _BabyGenderSelectorState createState() => _BabyGenderSelectorState();
}

class _BabyGenderSelectorState extends State<BabyGenderSelector> {
  bool isGirlSelected = false;
  bool isBoySelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGenderOption(context, AppStrings.girl, isGirlSelected, (value) {
          setState(() {
            isGirlSelected = value!;
            isBoySelected = false;
          });
          // Call onChanged with 0 for girl
          if (value! && widget.onChanged != null) {
            widget.onChanged!(0);
          }
        }),
        _buildGenderOption(context, AppStrings.boy, isBoySelected, (value) {
          setState(() {
            isBoySelected = value!;
            isGirlSelected = false;
          });
          // Call onChanged with 1 for boy
          if (value! && widget.onChanged != null) {
            widget.onChanged!(1);
          }
        }),
      ],
    );
  }

  Widget _buildGenderOption(BuildContext context, String gender,
      bool isSelected, Function(bool?) onChanged) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              image: AssetImage(
                gender == AppStrings.girl
                    ? AppImages.girlAccount
                    : AppImages.boyAccount,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        VerticalSpace(10),
        Column(
          children: [
            Text(
              gender,
              style: AppStyles.roboto18SemiBold.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            VerticalSpace(5),
            CustomCheckBox(
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    ).withHorizontalPadding(25);
  }
}
