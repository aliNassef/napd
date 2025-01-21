import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/cubit/app_cubit/app_state.dart';
import '../../utils/app_localizations.dart';

class AppCubit extends Cubit<AppState> {
  final AppLocalizations appLocalizations;

  AppCubit({required this.appLocalizations})
      : super(AppState(state: States.initial));

  Future<void> changeAppLanguage(BuildContext context, Locale locale) async {
    emit(state.copyWith(state: States.loading));
    try {
      await appLocalizations.changeLocale(context, locale);
      emit(state.copyWith(state: States.loaded));
    } catch (e) {
      emit(
        state.copyWith(
          state: States.error,
          errorMessage: 'Something went wrong, please try again.',
        ),
      );
    }
  }
}
