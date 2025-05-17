import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/groups/presentation/cubits/get_podcasts_cubit/get_podcasts_cubit.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/podcast_view_body.dart';

class PodcastsView extends StatelessWidget {
  const PodcastsView({super.key});
  static const String routeName = 'podcasts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.podcasts),
      body: BlocProvider(
        create: (context) => injector<GetPodcastsCubit>()..getPodcasts(),
        child: SafeArea(
          bottom: false,
          child: PodcastsViewBody(),
        ),
      ),
    );
  }
}
