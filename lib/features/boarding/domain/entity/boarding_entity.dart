import '../../../../core/utils/app_strings.dart';

import '../../../../core/utils/app_images.dart';

class BoardingEntity {
  final String img;
  final String title;
  final String subtitle;

  const BoardingEntity({
    required this.img,
    required this.title,
    required this.subtitle,
  });
}

List<BoardingEntity> getBoardingList() {
  return [
    BoardingEntity(
      title: AppStrings.parentingIsHard,
      subtitle: '',
      img: AppImages.boarding1,
    ),
    BoardingEntity(
      title: AppStrings.joinOurCommunities,
      subtitle: AppStrings.shareWithOtherParents,
      img: AppImages.boarding2,
    ),
    BoardingEntity(
      title: AppStrings.readAndShare,
      subtitle: AppStrings.readOthersPosts,
      img: AppImages.boarding3,
    ),
  ];
}
