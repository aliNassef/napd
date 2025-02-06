import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/widgets/appbars/custom_app_bar.dart';
import '../widgets/sound_notification_view_body.dart';

class SoundsNotificationView extends StatelessWidget {
  const SoundsNotificationView({super.key});
  static const routeName = 'SoundsNotificationView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'notifications'.tr()),
      body: SafeArea(
        child: SoundNotificationsViewBody(),
      ),
    );
  }
}
