import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/boarding_view_body.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});
  static const routeName = 'boarding_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BoardingViewBody(),
    );
  }
}
