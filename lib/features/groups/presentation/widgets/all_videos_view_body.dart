import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'video_item.dart';

class AllVideosViewBody extends StatelessWidget {
  const AllVideosViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 30.h,
        mainAxisExtent: 133.h,
      ),
      itemBuilder: (_, index) => VideoItem(),
    );
  }
}
