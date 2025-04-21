import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/nursery/presentation/cubit/nursing_cubit.dart';
import 'package:napd/features/nursery/presentation/cubit/nursing_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';

class DialogContentList extends StatelessWidget {
  const DialogContentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: BlocBuilder<NursingCubit, NursingState>(
        buildWhen: (previous, current) =>
            current is GovernateLoaded ||
            current is GovernateLoading ||
            current is GovernateFailure,
        builder: (context, state) {
          if (state is GovernateLoaded) {
            return ListView.separated(
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffEAE8E8),
                  ),
                  child: Text(
                    state.governorates[index].governorateName,
                    style: AppStyles.roboto20Regular.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return VerticalSpace(9);
              },
              itemCount: state.governorates.length,
            );
          }
          if (state is GovernateLoading) {
            return _buildLoadingGovernateList();
          }
          if (state is GovernateFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Skeletonizer _buildLoadingGovernateList() {
    return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffEAE8E8),
                  ),
                  child: Text(
                    'Egypt',
                    style: AppStyles.roboto20Regular.copyWith(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return VerticalSpace(9);
              },
              itemCount: 20,
            ),
          );
  }
}
