import 'package:flutter/material.dart';

class BabyImage extends StatelessWidget {
  const BabyImage({super.key});

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
