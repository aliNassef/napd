import 'package:flutter/material.dart';
import '../widgets/baby_profile_details_view_body.dart';

class BabyProfileDetailsView extends StatelessWidget {
  const BabyProfileDetailsView({super.key});
  static const String routeName = 'babyProfileDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BabyProfileDetailsViewBody(),
    );
  }
} 