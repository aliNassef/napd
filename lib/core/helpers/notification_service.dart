// notification_service.dart
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  static const String _channelId = 'reminder_channels';

  static Future<void> initialize() async {
    await _configureLocalTimeZone();
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onNotificationActionReceived,
      onNotificationCreatedMethod: _onNotificationCreated,
      onNotificationDisplayedMethod: _onNotificationDisplayed,
    );
    await _initializeNotificationChannels();
    await _requestPermissions();
  }

  static Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  static Future<void> _initializeNotificationChannels() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: _channelId,
          channelName: 'Reminders',
          channelDescription: 'Scheduled reminders',
          importance: NotificationImportance.High,
          playSound: true,
          defaultColor: AppColors.primaryColor,
          ledColor: AppColors.secondaryColor,
        ),
      ],
    );
  }

  static Future<void> _requestPermissions() async {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  static Future<void> _onNotificationActionReceived(
      ReceivedAction action) async {
    log('Notification tapped: ${action.id}');
    // Handle action here (e.g., navigate to a screen)
  }

  static Future<void> _onNotificationCreated(
      ReceivedNotification notification) async {
    log('Notification created: ${notification.id}');
  }

  static Future<void> _onNotificationDisplayed(
      ReceivedNotification notification) async {
    log('Notification displayed: ${notification.id}');
  }

  static int _generateNotificationId() {
    return DateTime.now().microsecondsSinceEpoch % (1 << 31);
  }

  Future<void> scheduleNotification({
    required DateTime scheduledTime,
    required String title,
    required String body,
  }) async {
    final tz.TZDateTime tzTime = tz.TZDateTime.from(scheduledTime, tz.local);
    if (tzTime.isBefore(scheduledTime)) {
      throw Exception('Scheduled time must be in the future');
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: _generateNotificationId(),
        channelKey: _channelId,
        title: title,
        body: body,
      ),
      schedule: NotificationCalendar(
        year: tzTime.year,
        month: tzTime.month,
        day: tzTime.day,
        hour: tzTime.hour,
        minute: tzTime.minute,
        second: tzTime.second,
        allowWhileIdle: true, // Works in Doze mode (Android)
        preciseAlarm: true, // Exact timing for Android 12+
      ),
    );
  }

  static void showNotifcation({
    required String title,
    required String body,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: _generateNotificationId(),
        channelKey: _channelId,
        title: title,
        body: body,
      ),
    );
  }

    Future<void> cancelNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
