import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/functions/show_error_message.dart';
import 'package:napd/core/functions/toast_dialog.dart';
import 'package:napd/features/home/data/model/gallrey_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';
import '../cubits/gallrey_cubit/gallrey_cubit.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    super.key,
    required this.gallrey,
  });
  final GallreyModel gallrey;
  @override
  Widget build(BuildContext context) {
    return BlocListener<GallreyCubit, GallreyState>(
      listener: (context, state) {
        if (state is DeleteImageToGallreyStateFailure) {
          showErrorMessage(context, errMessage: state.errMessage);
        }
        if (state is DeleteImageToGallreyStateLoaded) {
          showToast(text: 'Image deleted successfully');
        }
      },
      child: GestureDetector(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: context.read<GallreyCubit>(),
                  child: AlertDialog(
                    title: Text(
                      AppStrings.deleteImage,
                      style: AppStyles.roboto18Medium.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    content: Text(
                      AppStrings.deleteImageQuestion,
                      style: AppStyles.roboto16Medium.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.cancel,
                          style: AppStyles.roboto16Medium.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<GallreyCubit>()
                              .deleteGallreyImage(gallrey.id);
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.delete,
                          style: AppStyles.roboto16Medium.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomNetworkImage(
                img: gallrey.imageUrl,
                width: 180.w,
                height: 164.h,
              ),
            ),
            VerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  gallrey.createdAt.split(' ')[0],
                  style: AppStyles.roboto18Medium.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
