import 'package:flutter/material.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'nursery_item.dart';

class NurseryViewBody extends StatelessWidget {
  const NurseryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, int index) {
        return NurseryItem();
      },
      separatorBuilder: (_, __) => VerticalSpace(16),
      itemCount: 10,
    );
  }
}
