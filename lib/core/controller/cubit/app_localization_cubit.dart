import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/app_localizations.dart';

part 'app_localization_state.dart';

class AppLocalizationCubit extends Cubit<AppLocalizationState> {
  AppLocalizationCubit(this.appLocalizations) : super(AppLocalizationInitial());
  final AppLocalizations appLocalizations;
  Future<void> changeAppLanguage(BuildContext context, Locale locale) async {
    emit(AppLocalizationLoading());
   await appLocalizations.changeLocale(context, locale);
    emit(AppLocalizationReset());
  }

  String getAppLanguage(BuildContext context) {
    var localeName = appLocalizations.getLocaleName(context.locale);
    return localeName;
  }
}
