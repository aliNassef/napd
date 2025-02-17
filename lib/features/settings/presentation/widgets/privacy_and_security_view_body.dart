import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entity/privacy_and_security_entity.dart';

import '../../../../core/widgets/spacers.dart';
import 'privacy_item.dart';

class PrivacyAndSecurityViewBody extends StatelessWidget {
  const PrivacyAndSecurityViewBody({super.key});
  static const privacyData = [
    PrivacyAndSecurityEntity(
      title: '1️) Data Privacy',
      items: [
        {
          'Privacy Policy –': ' View how we handle your data.',
        },
        {
          'Data Sharing Preferences –':
              ' Choose whether to share insights with third parties.',
        },
        {
          'Delete My Data –':
              ' Request to delete your account and personal data.',
        }
      ],
    ),
    PrivacyAndSecurityEntity(
      title: '2️) Account Security',
      items: [
        {
          'Change Password –':
              ' Update your login credentials for better security.',
        },
        {
          'Two-Factor Authentication –':
              ' Enable extra protection for your account.',
        },
        {
          'Logged-in Devices –':
              ' View and manage devices that have accessed your account.',
        }
      ],
    ),
    PrivacyAndSecurityEntity(
      title: '3️) App Permissions',
      items: [
        {
          'Camera & Photos –':
              ' Control access to your gallery for baby profile pictures.',
        },
        {
          'Microphone Access –':
              ' Manage permissions for voice notes and video calls in the community.',
        },
        {
          'Location Services –':
              ' Enable or disable location access for nearby parenting events.',
        }
      ],
    ),
    PrivacyAndSecurityEntity(
      title: '4️) Parental & Child Safety',
      items: [
        {
          'Baby Data Protection –':
              ' Choose how your baby’s data is stored and used.',
        },
      ],
    ),
    PrivacyAndSecurityEntity(
      title: '5️) Additional Options',
      items: [
        {
          'eport an Issue –': ' Contact support for privacy concerns.',
        },
        {
          'Security Alerts –': '  Get notified about any suspicious activity.',
        },
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            children: [
              Icon(
                Icons.lock,
                color: Color(0xffFFB636),
              ),
              HorizantalSpace(10),
              Text(
                'Privacy & Security Settings',
                style: AppStyles.roboto24SemiBold.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Manage your personal data and security preferences to ensure a safe experience for you and your baby.',
            style: AppStyles.roboto16Regular.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        SliverToBoxAdapter(child: VerticalSpace(24)),
        SliverList.separated(
          itemBuilder: (_, index) => PrivacyItem(
            privacyEntity: privacyData[index],
          ),
          separatorBuilder: (_, __) => VerticalSpace(27),
          itemCount: privacyData.length,
        ),
        SliverToBoxAdapter(child: VerticalSpace(24)),
      ],
    ).withHorizontalPadding(16).withVerticalPadding(8);
  }
}
