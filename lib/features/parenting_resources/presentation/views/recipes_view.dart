import 'package:flutter/material.dart';
import '../widgets/recipes_app_bar.dart';
import '../widgets/recipes_view_body.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeTipsAppBar(),
      body: SafeArea(
        child: RecipesViewBody(),
      ),
    );
  }
}
