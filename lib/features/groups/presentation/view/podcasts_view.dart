import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: PodcastsViewBody(),
      ),
    );
  }
}
