import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../manger/nursing_cubit/nursing_cubit.dart';
import '../manger/nursing_cubit/nursing_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/models/hospital_model.dart';
import 'nursery_item.dart';

class NurseryViewBody extends StatelessWidget {
  const NurseryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NursingCubit, NursingState>(
      buildWhen: (previous, current) =>
          current is HospitalsLoaded ||
          current is HospitalsLoading ||
          current is HospitalsFailure,
      builder: (context, state) {
        if (state is HospitalsFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        if (state is HospitalsLoaded) {
          final hospitals = state.hospitals;
          if (hospitals.isEmpty) {
            return const Center(
              child: Text('No hospitals found'),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            itemBuilder: (_, int index) {
              return NurseryItem(
                hospital: hospitals[index],
              );
            },
            separatorBuilder: (_, __) => VerticalSpace(16),
            itemCount: hospitals.length,
          );
        }
        if (state is HospitalsLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (_, int index) {
                return NurseryItem(
                  hospital: dummyHospitals[index],
                );
              },
              separatorBuilder: (_, __) => VerticalSpace(16),
              itemCount: dummyHospitals.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  static List<HospitalModel> dummyHospitals = [
    HospitalModel(
      id: 1,
      title: 'Hospital 1',
      description: 'Hospital 1 description',
      rate: 5,
      isFavourite: false,
      imageUrl: 'assets/images/hospital1.png',
      governorateName: 'Governorate 1',
      isopended: true,
    ),
    HospitalModel(
      id: 1,
      title: 'Hospital 1',
      description: 'Hospital 1 description',
      rate: 5,
      isFavourite: false,
      imageUrl: 'assets/images/hospital1.png',
      governorateName: 'Governorate 1',
      isopended: true,
    ),
    HospitalModel(
      id: 1,
      title: 'Hospital 1',
      description: 'Hospital 1 description',
      rate: 5,
      isFavourite: false,
      imageUrl: 'assets/images/hospital1.png',
      governorateName: 'Governorate 1',
      isopended: true,
    ),
    HospitalModel(
      id: 1,
      title: 'Hospital 1',
      description: 'Hospital 1 description',
      rate: 5,
      isFavourite: false,
      imageUrl: 'assets/images/hospital1.png',
      governorateName: 'Governorate 1',
      isopended: true,
    ),
  ];
}
