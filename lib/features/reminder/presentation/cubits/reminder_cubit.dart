import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/reminder_model.dart';
import '../../data/repo/reminder_repo.dart';
import 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  final ReminderRepo _reminderRepo;

  ReminderCubit({required ReminderRepo reminderRepo})
      : _reminderRepo = reminderRepo,
        super(const ReminderInitial());

  Future<void> getReminders() async {
    emit(const ReminderLoading());

    final result = _reminderRepo.getReminders();

    result.fold(
      (failure) => emit(ReminderError(message: failure.errMessage)),
      (reminders) => emit(RemindersLoaded(reminders: reminders)),
    );
  }

  Future<void> addReminder(ReminderModel reminder) async {
    emit(const ReminderLoading());

    final result = _reminderRepo.addReminder(reminder);

    result.fold(
      (failure) => emit(ReminderError(message: failure.errMessage)),
      (_) {
        emit(const ReminderAdded());
        getReminders();
      },
    );
  }

  Future<void> updateReminder(ReminderModel reminder) async {
    emit(const ReminderLoading());

    final result = _reminderRepo.updateReminder(reminder);

    result.fold(
      (failure) => emit(ReminderError(message: failure.errMessage)),
      (_) {
        emit(const ReminderUpdated());
        getReminders();
      },
    );
  }

  Future<void> removeReminder(ReminderModel reminder) async {
    final result = _reminderRepo.removeReminder(reminder);

    result.fold(
      (failure) => emit(ReminderError(message: failure.errMessage)),
      (_) {
        getReminders();
      },
    );
  }
}
