import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../widgets/podcasts_details_view_body.dart';

class PodcastsDetailsView extends StatelessWidget {
  static const String routeName = 'podcasts-details';
  const PodcastsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Podcasts Details'),
      body: PodcastsDetailsViewBody(),
    );
  }
}
