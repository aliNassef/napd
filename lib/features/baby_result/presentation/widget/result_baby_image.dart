import 'package:flutter/material.dart';

class ResultBabyImage extends StatelessWidget {
  const ResultBabyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 135,
      backgroundImage: AssetImage('assets/images/baby_result.png'),
    );
  }
}
