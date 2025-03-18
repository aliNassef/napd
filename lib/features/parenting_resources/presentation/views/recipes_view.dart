import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/recipes_view_body.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});
  static const routeName = 'recipes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.recipes,
      ),
      body: SafeArea(
        child: RecipesViewBody(),
      ),
    );
  }
}
