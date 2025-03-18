import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/about_view_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static const routeName = 'aboutview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.about),
      body: SafeArea(
        child: AboutViewBody(),
      ),
    );
  }
}
