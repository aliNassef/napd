import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../widgets/nursery_view_body.dart';

class NurseryView extends StatelessWidget {
  const NurseryView({super.key});
  static const routeName = 'nursery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(title: ''),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: NurseryViewBody(),
      ),
    );
  }
}
