import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../cubits/tips_and_trics_cubit/tips_and_trics_cubit.dart';
import '../widgets/tips_and_trick_view_body.dart';

class TipsAndTricksView extends StatelessWidget {
  const TipsAndTricksView({super.key});
  static const routeName = 'tips-and-tricks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.tipsAndTricks,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<TipsAndTricsCubit>()..getTipsAndTricks(),
          child: TipsAndTricksViewBody(),
        ),
      ),
    );
  }
}
