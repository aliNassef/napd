import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/reminder/data/model/reminder_model.dart';
import 'package:napd/features/reminder/data/source/reminder_local_datasource.dart';

import 'reminder_repo.dart';

class ReminderRepoImpl extends ReminderRepo {
  final ReminderLocalDatasource _localDatasource;

  ReminderRepoImpl({required ReminderLocalDatasource localDatasource})
      : _localDatasource = localDatasource;

  @override
  Either<Failure, void> addReminder(ReminderModel reminder) {
    try {
      _localDatasource.addReminder(reminder);
      return const Right(null);
    } on CustomException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorMessage,
        ),
      );
    }
  }

  @override
  Either<Failure, List<ReminderModel>> getReminders() {
    try {
      final reminders = _localDatasource.getReminders();
      return Right(reminders);
    } on CustomException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorMessage,
        ),
      );
    }
  }

  @override
  Either<Failure, void> removeReminder(ReminderModel reminder) {
    try {
      _localDatasource.deleteReminder(reminder.id);
      return const Right(null);
    } on CustomException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorMessage,
        ),
      );
    }
  }

  @override
  Either<Failure, void> updateReminder(ReminderModel reminder) {
    try {
      _localDatasource.updateReminder(reminder);
      return const Right(null);
    } on CustomException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorMessage,
        ),
      );
    }
  }
}
