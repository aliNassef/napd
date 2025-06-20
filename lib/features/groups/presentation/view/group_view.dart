import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../cubits/get_top_for_you_cubit/get_top_for_you_cubit.dart';
import '../widgets/for_you_view_body.dart';
import '../widgets/group_app_bar.dart';

class GroupView extends StatefulWidget {
  const GroupView({super.key});

  @override
  State<GroupView> createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 0),
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        appBar: GroupAppBar(),
        body: TabBarView(
          children: [
            // GroupViewBody(),
            BlocProvider(
              create: (context) => injector<GetTopForYouCubit>()
                ..getTopArticles()
                ..getTopPodcasts()
                ..getTopVideos(),
              child: ForyouViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}
