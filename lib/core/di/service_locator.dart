import 'package:get_it/get_it.dart';
import 'package:napd/core/utils/app_localizations.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  injector.registerSingleton<AppLocalizations>(
    AppLocalizationsImpl(),
  );
}
