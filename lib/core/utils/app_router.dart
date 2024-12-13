import 'package:flutter/material.dart';

import '../../features/boarding/presentation/view/boarding_view.dart';
import '../../features/boarding/presentation/view/start_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BoardingView(),
      );
    case StartView.routeName:
      return MaterialPageRoute(
        builder: (context) => const StartView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
