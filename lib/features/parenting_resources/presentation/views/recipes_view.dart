import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/features/parenting_resources/presentation/cubits/recipe_cubit/recipe_cubit.dart';
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
      body: BlocProvider(
        create: (context) => injector<RecipeCubit>()..getRecipes(),
        child: SafeArea(
          child: RecipesViewBody(),
        ),
      ),
    );
  }
}
