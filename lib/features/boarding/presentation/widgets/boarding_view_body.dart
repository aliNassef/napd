import 'package:flutter/material.dart';

class BoardingViewBody extends StatelessWidget {
  const BoardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => Container(),
      itemCount: 3,
    );
  }
}
