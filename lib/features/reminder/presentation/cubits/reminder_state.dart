import 'package:napd/features/reminder/data/model/reminder_model.dart';

abstract class ReminderState {
  const ReminderState();
}

class ReminderInitial extends ReminderState {
  const ReminderInitial();
}

class ReminderLoading extends ReminderState {
  const ReminderLoading();
}

class RemindersLoaded extends ReminderState {
  final List<ReminderModel> reminders;

  const RemindersLoaded({required this.reminders});
}

class ReminderAdded extends ReminderState {
  const ReminderAdded();
}

class ReminderUpdated extends ReminderState {
  const ReminderUpdated();
}

class ReminderRemoved extends ReminderState {
  const ReminderRemoved();
}

class ReminderError extends ReminderState {
  final String message;

  const ReminderError({required this.message});
}
