import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  bool isGirlSelected = false;
  bool isBoySelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGenderOption(context, "Girl", isGirlSelected, (value) {
          setState(() {
            isGirlSelected = value!;
            isBoySelected = false;
          });
        }),
        _buildGenderOption(context, "Boy", isBoySelected, (value) {
          setState(() {
            isBoySelected = value!;
            isGirlSelected = false;
          });
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
                gender == "Girl"
                    ? "assets/images/girl_account.png"
                    : "assets/images/boy_account.jpg",
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
              style: AppStyles.textStyle18SB.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            VerticalSpace(5),
            Transform.scale(
              scale: 1.6,
              child: Checkbox(
                value: isSelected,
                onChanged: onChanged,
                side: BorderSide(
                  color: AppColors.secondaryColor,
                  width: 1.2,
                ),
                fillColor: WidgetStateProperty.all(Colors.transparent),
                checkColor: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
