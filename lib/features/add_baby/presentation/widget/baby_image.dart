// lib/features/add_baby/presentation/widgets/baby_image.dart
import 'package:flutter/material.dart';

class BabyImage extends StatelessWidget {
  const BabyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/images/baby_hands.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
