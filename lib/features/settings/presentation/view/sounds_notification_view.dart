import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/sound_notification_view_body.dart';

class SoundsNotificationView extends StatelessWidget {
  const SoundsNotificationView({super.key});
  static const routeName = 'SoundsNotificationView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.notifications),
      body: SafeArea(
        child: SoundNotificationsViewBody(),
      ),
    );
  }
}
