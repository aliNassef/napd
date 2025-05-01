import 'package:flutter/material.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import '../widgets/baby_profile_details_view_body.dart';

class BabyProfileDetailsView extends StatelessWidget {
  const BabyProfileDetailsView({super.key, required this.baby});
  final BabyModel baby;
  static const String routeName = 'babyProfileDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BabyProfileDetailsViewBody(
        baby : baby,
      ),
    );
  }
}
