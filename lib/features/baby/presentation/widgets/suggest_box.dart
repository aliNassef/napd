import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SuggestionBox extends StatelessWidget {
  const SuggestionBox({super.key, required this.suggestion});
  final String suggestion;
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
          suggestion == 'hungry'
              ? 'Your baby might be crying because they\'re hungry. Try feeding them to see if it helps. '
                  'If they’re breastfeeding, ensure they’re getting enough milk. '
                  'If bottle-feeding, check the amount and flow of milk. '
                  'If feeding doesn’t soothe them, consider other possibilities like discomfort or needing a diaper change.'
              : 'Your baby might be crying due to discomfort. Try adjusting their clothing or environment to ensure they’re comfortable. If they’re too warm or cold, change their outfit or adjust the room temperature. If discomfort persists, check for other causes like a dirty diaper or the need for burping.',
          style: AppStyles.roboto14SemiBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
