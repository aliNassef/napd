import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 3,
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final maxLines = widget.maxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: isExpanded ? null : maxLines,
          overflow: isExpanded ? null : TextOverflow.ellipsis,
          style: AppStyles.roboto14Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        if (text.isNotEmpty)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Read Less' : 'Read More',
              style: AppStyles.roboto14Regular.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
