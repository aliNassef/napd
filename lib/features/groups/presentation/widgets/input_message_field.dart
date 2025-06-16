import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/core/utils/app_localizations.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';

import '../../../../core/helpers/image_picker_helper.dart';
import '../../../../core/utils/app_colors.dart';

class InputMessageField extends StatelessWidget {
  const InputMessageField(
      {super.key,
      this.isgroup = false,
      this.onSendTap,
      required this.messageController});
  final bool isgroup;
  final void Function()? onSendTap;
  final TextEditingController messageController;
  @override
  Widget build(BuildContext context) {
    return isgroup
        ? Row(
            children: [
              IconButton(
                onPressed: () {
                  ImagePickerHelper.openCamera(onGet: (imageFile) {});
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: AppColors.darkBlueColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  ImagePickerHelper.openGallery(onGet: (imageFile) {});
                },
                icon: SvgPicture.asset(AppSvgs.selectImageIcon),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      AppShadows.shadow6,
                    ],
                  ),
                  child: TextField(
                    controller: messageController,
                    keyboardType: TextInputType.multiline,
                    style: AppStyles.roboto13Bold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    minLines: 1,
                    maxLines: 3,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      hintStyle: AppStyles.roboto13Bold.copyWith(
                        color: AppColors.primaryColor,
                      ),
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.white,
                      filled: true,
                      border: _buildBorderStyle(),
                      enabledBorder: _buildBorderStyle(),
                      focusedBorder: _buildBorderStyle(),
                      hintText: AppStrings.typeYourMessage,
                      suffixIcon: IconButton(
                        onPressed: onSendTap,
                        icon: SvgPicture.asset(AppSvgs.sendIcon),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                AppShadows.shadow6,
              ],
            ),
            child: TextField(
              controller: messageController,
              keyboardType: TextInputType.multiline,
              style: AppStyles.roboto13Bold.copyWith(
                color: AppColors.primaryColor,
              ),
              minLines: 1,
              maxLines: 3,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintStyle: AppStyles.roboto13Bold.copyWith(
                  color: AppColors.primaryColor,
                ),
                contentPadding: EdgeInsets.all(16),
                fillColor: Colors.white,
                filled: true,
                border: _buildBorderStyle(),
                enabledBorder: _buildBorderStyle(),
                focusedBorder: _buildBorderStyle(),
                hintText: AppStrings.typeYourMessage,
                suffixIcon: IconButton(
                  onPressed: onSendTap,
                  icon: injector<AppLocalizations>().isArabic(context)
                      ? Transform.rotate(
                          angle: pi,
                          child: SvgPicture.asset(AppSvgs.sendIcon),
                        )
                      : SvgPicture.asset(AppSvgs.sendIcon),
                ),
              ),
            ),
          );
  }

  OutlineInputBorder _buildBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    );
  }
}
