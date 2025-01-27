import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/spacers.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Record Button
        IconButton(
          icon: Icon(
            Icons.fiber_smart_record_outlined,
            color: AppColors.secondaryColor,
            size: 55,
          ),
          onPressed: () {},
        ),
        HorizantalSpace(30),
        // Pause Button
        IconButton(
          icon: Icon(
            Icons.pause_circle_outline_outlined,
            color: AppColors.secondaryColor,
            size: 60,
          ),
          onPressed: () {},
        ),
        HorizantalSpace(30),
        // Stop Button
        IconButton(
          icon: Icon(
            Icons.stop_circle_outlined,
            color: AppColors.greyColor,
            size: 55,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
