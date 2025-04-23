import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/models/hospital_model.dart';
import 'favorite_button_bloc_consumer.dart';

class NurseryItem extends StatelessWidget {
  const NurseryItem({super.key, required this.hospital});
  final HospitalModel hospital;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppShadows.shadow3,
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomNetworkImage(
              height: 100.h,
              width: 100.w,
              img: hospital.imageUrl ?? '',
            ),
          ).withHorizontalPadding(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      hospital.title!,
                      style: AppStyles.rubik18Medium.copyWith(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    const Spacer(),
                    FavoriteButtonBlocConsumer(hospital: hospital),
                  ],
                ),
                Text(
                  hospital.description!,
                  style: AppStyles.rubik14Light.copyWith(
                    color: Color(0xff808080),
                  ),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: hospital.rate!.toDouble(),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(0xffF6D060),
                      ),
                      itemCount: 5,
                      itemSize: 14.0,
                      direction: Axis.horizontal,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      hospital.isopended! ? 'Open' : 'Closed',
                      style: AppStyles.rubik16Medium.copyWith(
                        color: hospital.isopended!
                            ? AppColors.greenLightColor
                            : Color(0xffD80027).withValues(alpha: 0.8),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).withVerticalPadding(12),
    );
  }
}
