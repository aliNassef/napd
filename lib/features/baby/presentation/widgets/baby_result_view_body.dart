
import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/models/cry_model.dart';
import 'box_cry_result.dart';
import 'prediction_list.dart';
import 'suggest_box.dart';

class BabyResultViewBody extends StatelessWidget {
  const BabyResultViewBody({
    super.key,
    required this.cryModel,
  });

  final CryModel cryModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalSpace(40),
          CircleAvatar(
            radius: 135,
            backgroundImage: AssetImage(AppImages.cryResult),
          ),
          VerticalSpace(8),
          BoxCryResult(result: cryModel.cry),
          VerticalSpace(8),
          PredictionList(predictions: cryModel),
          VerticalSpace(16),
          SuggestionBox(
            suggestion: cryModel.cry,
          ),
        ],
      ).withHorizontalPadding(8),
    );
  }
}
