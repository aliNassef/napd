import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_images.dart';

import '../../domain/entity/boarding_entity.dart';

class BoardingViewBody extends StatelessWidget {
  const BoardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              child: Text('Skip'),
            ),
          )
        ],
      ),
      itemCount: 3,
    );
  }

  final List<BoardingEntity> boardingList = const [
    BoardingEntity(
      title: 'Parenting is hard, don’t do it alone',
      subtitle: '',
      img: AppSvgs.boarding1,
    ),
    BoardingEntity(
      title: 'Join our communities ',
      subtitle:
          'Share with other parents your experience and explore our groups',
      img: AppSvgs.boarding2,
    ),
    BoardingEntity(
      title: 'Read  and share ',
      subtitle:
          'Read others posts and share with them your experience will be helpful ',
      img: AppSvgs.boarding3,
    ),
  ];
}
