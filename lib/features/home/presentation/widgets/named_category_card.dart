
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class NameCategoryCard extends StatelessWidget {
  final String name;
  final String category;

  const NameCategoryCard({
    super.key,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          name,
          style: AppStyles.roboto16Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        subtitle: Text(
          category,
          style: AppStyles.roboto16Regular.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
