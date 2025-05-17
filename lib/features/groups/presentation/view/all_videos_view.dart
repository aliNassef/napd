import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/di/service_locator.dart';
import 'package:napd/features/groups/presentation/cubits/get_all_videos_cubit/get_all_videos_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/all_videos_view_body.dart';

class AllVideosView extends StatelessWidget {
  const AllVideosView({super.key});
  static const routeName = 'all-videos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.videos),
      body: BlocProvider(
        create: (context) => injector<GetAllVideosCubit>()..getAllVideos(),
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: Column(
                children: [
                  VerticalSpace(30),
                  Expanded(
                    child: AllVideosViewBody(),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
