import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/features/nursery/presentation/cubit/nursing_cubit.dart';
import '../../../../core/widgets/appbars/custom_search_app_bar.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/dialog_content_list.dart';
import '../widgets/nursery_view_body.dart';

class NurseryView extends StatelessWidget {
  const NurseryView({super.key});
  static const routeName = 'nursery';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<NursingCubit>()..getAllHospitals(),
      child: Scaffold(
        appBar: CustomSearchAppBar(
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                final nursingCubit = context.read<NursingCubit>();
                _buildDialog(context, nursingCubit);
              },
              child: SvgPicture.asset(AppSvgs.filterIcon),
            );
          }),
        ),
        body: SafeArea(
          child: NurseryViewBody(),
        ),
      ),
    );
  }

  Future<dynamic> _buildDialog(
      BuildContext context, NursingCubit nursingCubit) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.only(
            bottom: 10.h,
          ),
          titlePadding: EdgeInsets.symmetric(
            vertical: 35.h,
            horizontal: 20.w,
          ),
          backgroundColor: Colors.white,
          title: CustomSearchBar(),
          content: BlocProvider.value(
            value: nursingCubit..getAllGovernorates(),
            child: DialogContentList(),
          ),
        );
      },
    );
  }
}
