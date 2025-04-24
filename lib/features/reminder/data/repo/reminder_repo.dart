import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/reminder_model.dart';

abstract class ReminderRepo {
  Either<Failure, List<ReminderModel>> getReminders();
  Either<Failure, void> addReminder(ReminderModel reminder);
  Either<Failure, void> removeReminder(ReminderModel reminder);
  Either<Failure, void> updateReminder(ReminderModel reminder);
}
