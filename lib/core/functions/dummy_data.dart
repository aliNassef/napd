import 'package:napd/features/boarding/domain/entity/boarding_entity.dart';

import '../utils/app_images.dart';

List<BoardingEntity> getBoardingList() {
  return [
    BoardingEntity(
      title: 'Parenting is hard, don’t do it alone',
      subtitle: '',
      img: AppImages.boarding1,
    ),
    BoardingEntity(
      title: 'Join our communities ',
      subtitle:
          'Share with other parents your experience and explore our groups',
      img: AppImages.boarding2,
    ),
    BoardingEntity(
      title: 'Read  and share ',
      subtitle:
          'Read others posts and share with them your experience will be helpful ',
      img: AppImages.boarding3,
    ),
  ];
}
