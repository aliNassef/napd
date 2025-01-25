import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/spacers.dart';
import 'podcasts_audio_item.dart';

class PodcastsViewBody extends StatelessWidget {
  const PodcastsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemBuilder: (_, index) => PodcastsAudioItem(),
      separatorBuilder: (_, __) => VerticalSpace(12),
      itemCount: 10,
    );
  }
}
