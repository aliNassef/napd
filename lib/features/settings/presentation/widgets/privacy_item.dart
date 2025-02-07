import 'package:flutter/material.dart';
import 'package:napd/features/settings/domain/entity/privacy_and_security_entity.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class PrivacyItem extends StatelessWidget {
  const PrivacyItem({
    super.key,
    required this.privacyEntity,
  });
  final PrivacyAndSecurityEntity privacyEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          privacyEntity.title,
          style: AppStyles.roboto24SemiBold.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        VerticalSpace(8),
        ...privacyEntity.items.map(
          (e) => Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: e.keys.first,
                  style: AppStyles.roboto16Regular.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                TextSpan(
                  text: e.values.first,
                  style: AppStyles.roboto16Regular.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
