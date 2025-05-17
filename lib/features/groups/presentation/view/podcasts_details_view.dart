import 'package:flutter/material.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../../data/model/podcast_model.dart';
import '../widgets/podcasts_details_view_youtube.dart';
import 'podcast_details_view_video_by_link.dart';

class PodcastsDetailsView extends StatelessWidget {
  static const String routeName = 'podcasts-details';
  const PodcastsDetailsView({super.key, required this.audio});
  final PodcastModel audio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: audio.type),
      body: SingleChildScrollView(
        child: audio.url.contains('youtube')
            ? PodcastsDetailsViewYoutube(
                audio: audio,
              )
            : PodcastDetailsViewVideoBylink(
                audio: audio,
              ),
      ),
    );
  }
}

