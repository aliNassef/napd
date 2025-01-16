import 'package:flutter/material.dart';

class DrawerItemEntity {
  final String text;
  final String image;
  final void Function(BuildContext context)? onTap;

  const DrawerItemEntity({
    required this.text,
    required this.image,
    required this.onTap,
  });
}
