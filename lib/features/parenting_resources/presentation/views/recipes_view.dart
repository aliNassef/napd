import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/recipes_view_body.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});
  static const routeName = 'recipes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'recipes'.tr(),
      ),
      body: SafeArea(
        child: RecipesViewBody(),
      ),
    );
  }
}
