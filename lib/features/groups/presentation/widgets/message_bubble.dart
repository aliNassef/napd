import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.text,
    this.bubbleColor,
    this.nip,
  });
  final String text;
  final Color? bubbleColor;
  final BubbleNip? nip;
  @override
  Widget build(BuildContext context) {
    return Bubble(
      color: bubbleColor ?? AppColors.darkBlueColor,
      nip: nip ?? BubbleNip.leftBottom,
      radius: Radius.circular(10),
      alignment: Alignment.centerLeft,
      padding: const BubbleEdges.all(14),
      margin: BubbleEdges.all(10),
      child: Text(
        text,
        style: AppStyles.roboto12Medium.copyWith(color: Colors.white),
      ),
    );
  }
}
