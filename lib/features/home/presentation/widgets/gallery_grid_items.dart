import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../data/model/gallrey_model.dart';
import '../cubits/gallrey_cubit/gallrey_cubit.dart';
import '../widgets/gallery_item.dart';

class GalleryGridItems extends StatelessWidget {
  const GalleryGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GallreyCubit, GallreyState>(
      buildWhen: (previous, current) =>
          current is GallreyFailure ||
          current is GallreyLoading ||
          current is GallreyLoaded,
      builder: (context, state) {
        if (state is GallreyFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        if (state is GallreyLoading) {
          return Skeletonizer(
            enabled: true,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 32.w,
                childAspectRatio: 180 / 164,
                mainAxisExtent: 200.h,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (_, index) {
                return GalleryItem(
                  gallrey: GallreyModel(
                    id: 1,
                    createdAt: '1/1/2025',
                    imageUrl:
                        'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
                    description: 'description',
                  ),
                );
              },
              itemCount: 10,
            ),
          );
        }
        if (state is GallreyLoaded) {
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
              return GalleryItem(
                gallrey: state.gallrey[index],
              );
            },
            itemCount: state.gallrey.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
