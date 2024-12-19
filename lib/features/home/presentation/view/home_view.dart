import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      drawer: CustomDrawer(),
      body: HomeViewBody(),
    );
  }
}
