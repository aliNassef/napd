import 'package:flutter/material.dart';
import 'package:napd/core/widgets/background_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/boarding_view_body.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});
  static const routeName = 'boarding_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BackgroundWidget(
        child: BoardingViewBody(),
      ),
    );
  }
}
