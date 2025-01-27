import 'package:flutter/material.dart';

class CryTranslatorImage extends StatelessWidget {
  const CryTranslatorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/baby_cry.png",
      height: 490,
      width: 500,
    );
  }
}
