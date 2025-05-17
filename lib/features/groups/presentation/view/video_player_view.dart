import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../data/model/video_model.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.videoModel});
  static const routeName = 'video_player_widget';
  final VideoModel videoModel;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoModel.url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.videoModel.description),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(30),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: AppColors.darkBlueColor,
                progressColors: const ProgressBarColors(
                  playedColor: AppColors.darkBlueColor,
                  bufferedColor: AppColors.darkBlueColor,
                ),
              ),
            ),
            VerticalSpace(30),
            Text(
              widget.videoModel.title,
              style: AppStyles.roboto20Bold.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ],
        ).withHorizontalPadding(16),
      ),
    );
  }
}
