import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/default_app_button.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultAppButton(
      text: "add".tr(),
      onPressed: () {},
      backgroundColor: AppColors.secondaryColor,
      textColor: AppColors.primaryColor,
      padding: 48,
    );
  }
}
