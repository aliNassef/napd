import 'package:flutter/material.dart';

import '../../features/boarding/presentation/view/boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BoardingView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
