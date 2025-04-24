import 'dart:convert';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/cache/cache_helper.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/helpers/notification_service.dart';

import '../model/reminder_model.dart';

abstract class ReminderLocalDatasource {
  List<ReminderModel> getReminders();
  void addReminder(ReminderModel reminder);
  void updateReminder(ReminderModel reminder);
  void deleteReminder(int id);
}

class ReminderLocalDatasourceImpl implements ReminderLocalDatasource {
  final NotificationService _notificationService;
  final CacheHelper _cacheHelper;
  ReminderLocalDatasourceImpl(
      {required NotificationService notificationService,
      required CacheHelper cacheHelper})
      : _notificationService = notificationService,
        _cacheHelper = cacheHelper;

  @override
  void addReminder(ReminderModel reminder) {
    try {
      _notificationService.scheduleNotification(
        title: reminder.title,
        body: reminder.description,
        scheduledTime: reminder.dateTime,
      );
      List<ReminderModel> reminders = getReminders();
      reminders.add(reminder);

      _saveReminders(reminders);
    } catch (e) {
      throw CustomException(
        errorMessage: 'there is something went wrong when trying add reminder',
      );
    }
  }

  @override
  void deleteReminder(int id) {
    try {
      List<ReminderModel> reminders = getReminders();

      reminders.removeWhere((reminder) => reminder.id == id);

      _notificationService.cancelNotification(id);

      _saveReminders(reminders);
    } catch (e) {
      throw CustomException(
        errorMessage:
            'there is something went wrong when trying delete reminder',
      );
    }
  }

  @override
  List<ReminderModel> getReminders() {
    try {
      final reminderJson = _cacheHelper.getData(key: ApiKey.notification);
      if (reminderJson == null) {
        return [];
      }

      try {
        final List<dynamic> remindersList = json.decode(reminderJson);
        return remindersList
            .map((json) => ReminderModel.fromJson(json))
            .toList();
      } catch (e) {
        return [];
      }
    } catch (e) {
      throw CustomException(
        errorMessage: 'there is something went wrong when trying get reminders',
      );
    }
  }

  @override
  void updateReminder(ReminderModel reminder) {
    try {
      List<ReminderModel> reminders = getReminders();

      final index = reminders.indexWhere((r) => r.id == reminder.id);

      if (index != -1) {
        _notificationService.cancelNotification(reminders[index].id);

        reminders[index] = reminder;

        _notificationService.scheduleNotification(
          title: reminder.title,
          body: reminder.description,
          scheduledTime: reminder.dateTime,
        );

        _saveReminders(reminders);
      }
    } catch (e) {
      throw CustomException(
        errorMessage:
            'there is something went wrong when trying update reminder',
      );
    }
  }

  void _saveReminders(List<ReminderModel> reminders) {
    final List<Map<String, dynamic>> jsonList =
        reminders.map((reminder) => reminder.toJson()).toList();

    _cacheHelper.saveData(
        key: ApiKey.notification, value: json.encode(jsonList));
  }
}
