import 'package:flutter/material.dart';
import '../../data/models/cry_model.dart';
import 'prediction_card.dart';

class PredictionList extends StatelessWidget {
  final CryModel predictions;

  const PredictionList({super.key, required this.predictions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PredictionCard(
          status: predictions.cry,
          percentage: decimalToPercentString(predictions.confidence),
        ),
      ],
    );
  }
  String decimalToPercentString(num value) {
  return "${(value * 100).toStringAsFixed(0)}%";
}
}
