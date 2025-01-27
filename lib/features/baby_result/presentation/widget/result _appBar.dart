import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';

class ResultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ResultAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
