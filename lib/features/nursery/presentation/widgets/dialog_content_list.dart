import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';

class DialogContentList extends StatelessWidget {
  const DialogContentList({
    super.key,
  });
  static const List<String> egyptianCities = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Beni-suef",
    "Aswan",
    "Menia",
    "Fayom",
    "Asyut",
    "Suez",
    "Sohag",
    "Luxor",
    "Esmailia",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.separated(
        itemBuilder: (_, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 11.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xffEAE8E8),
            ),
            child: Text(
              egyptianCities[index],
              style: AppStyles.roboto20Regular.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return VerticalSpace(9);
        },
        itemCount: egyptianCities.length,
      ),
    );
  }
}
