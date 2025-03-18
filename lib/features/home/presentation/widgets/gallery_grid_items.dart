import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/gallery_item.dart';

class GalleryGridItems extends StatelessWidget {
  const GalleryGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 32.w,
        childAspectRatio: 180 / 164,
        mainAxisExtent: 200.h,
        mainAxisSpacing: 16.h,
      ),
      itemBuilder: (_, index) {
        return GalleryItem();
      },
      itemCount: 10,
    );
  }
}
