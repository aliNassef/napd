part of 'app_localization_cubit.dart';

@immutable
sealed class AppLocalizationState {
  
}

final class AppLocalizationInitial extends AppLocalizationState {}

final class AppLocalizationReset extends AppLocalizationState {}
