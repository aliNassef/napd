import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/mediaquery_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.text,
    this.bubbleColor,
    this.alignment,
    this.nip,
  });
  final String text;
  final Color? bubbleColor;
  final BubbleNip? nip;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Bubble(
      color: bubbleColor ?? AppColors.darkBlueColor,
      nip: nip ?? BubbleNip.leftBottom,
      radius: Radius.circular(10),
      alignment: alignment ?? Alignment.centerLeft,
      padding: const BubbleEdges.all(14),
      margin: BubbleEdges.all(10),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width * 0.6),
        child: Text(
          text,
          style: AppStyles.roboto12Medium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
