import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/baby_result_view_body.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../../../features/baby/data/models/cry_model.dart';

class BabyResultView extends StatelessWidget {
  static const String routeName = 'resultOfRecording';
  const BabyResultView({super.key, required this.cryModel});
  final CryModel cryModel;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.result),
      body: SafeArea(
        child: BabyResultViewBody(cryModel: cryModel),
      ),
    );
  }
}
