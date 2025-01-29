import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/baby_profile_view_body.dart';

class BabyProfileView extends StatelessWidget {
  const BabyProfileView({super.key});
  static const String routeName = 'babyProfileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Baby Profile'),
      body: BabyProfileViewBody(),
    );
  }
}
