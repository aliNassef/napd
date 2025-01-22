import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';

import 'package:napd/core/widgets/spacers.dart';

import 'package:napd/features/baby_result/presentation/widget/prediction_card_widget.dart';
import 'package:napd/features/baby_result/presentation/widget/prediction_list.dart';
import 'package:napd/features/baby_result/presentation/widget/result%20_appBar.dart';
import 'package:napd/features/baby_result/presentation/widget/result_baby_image.dart';
import 'package:napd/features/baby_result/presentation/widget/suggestion_Box.dart';

class BabyResultScreen extends StatelessWidget {
  static const String routeName = '/resultOfRecording';
  const BabyResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Sample data for predictions
    final predictions = [
      {'status': 'Hungry', 'percentage': 82},
      {'status': 'Sleepy', 'percentage': 18},
    ];

    return Scaffold(
      appBar: const ResultAppbar(title: 'Result'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResultBabyImage(),
                VerticalSpace(8),
                PredictionCardWidget(status: "I'm hungry!", percentage: 82),
                VerticalSpace(8),
                PredictionList(predictions: predictions),
                VerticalSpace(16),
                SuggestionBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
