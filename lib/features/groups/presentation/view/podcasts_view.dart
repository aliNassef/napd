import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/podcast_view_body.dart';

class PodcastsView extends StatelessWidget {
  const PodcastsView({super.key});
  static const String routeName = 'podcasts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'podcasts'.tr()),
      body: SafeArea(
        child: PodcastsViewBody(),
      ),
    );
  }
}
