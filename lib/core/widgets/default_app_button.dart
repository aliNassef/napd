import 'package:flutter/material.dart';
import '../extensions/padding_extension.dart';

import '../utils/app_styles.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.icon = const SizedBox(),
    this.padding = 0,
  });
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget icon;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding:
            const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        alignment: Alignment.center,
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.roboto24SemiBold.copyWith(
              color: textColor,
            ),
          ),
          icon
        ],
      ),
    ).withHorizontalPadding(padding);
  }
}
