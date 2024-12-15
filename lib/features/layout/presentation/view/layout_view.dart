import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const routeName = 'layout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout')),
      drawer: CustomDrawer(),
      body: LayoutViewBody(),
    );
  }
}
