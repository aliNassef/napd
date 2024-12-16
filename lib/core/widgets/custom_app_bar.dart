import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.hasLeading = false,
  });
  final String title;
  final bool hasLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
