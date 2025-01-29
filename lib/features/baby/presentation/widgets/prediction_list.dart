import 'package:flutter/material.dart';
import 'package:napd/features/baby/presentation/widgets/prediction_card.dart';

class PredictionList extends StatelessWidget {
  final List<Map<String, dynamic>> predictions;

  const PredictionList({super.key, required this.predictions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: predictions.map((prediction) {
        return PredictionCard(
          status: prediction['status'] as String,
          percentage: prediction['percentage'] as int,
        );
      }).toList(),
    );
  }
}
