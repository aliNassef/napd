import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SuggestionBox extends StatelessWidget {
  const SuggestionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFFFFF7FA),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Center(
        child: Text(
          'Your baby might be crying because they\'re hungry. Try feeding them to see if it helps. '
          'If they’re breastfeeding, ensure they’re getting enough milk. '
          'If bottle-feeding, check the amount and flow of milk. '
          'If feeding doesn’t soothe them, consider other possibilities like discomfort or needing a diaper change.',
          style: AppStyles.roboto14SemiBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}