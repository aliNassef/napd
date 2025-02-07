import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/widgets/appbars/custom_app_bar.dart';
import '../widgets/about_view_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static const routeName = 'aboutview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'about'.tr()),
      body: SafeArea(
        child: AboutViewBody(),
      ),
    );
  }
}
