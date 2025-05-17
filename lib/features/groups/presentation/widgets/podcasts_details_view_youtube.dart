import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/model/podcast_model.dart';

class PodcastsDetailsViewYoutube extends StatefulWidget {
  const PodcastsDetailsViewYoutube({
    super.key,
    required this.audio,
  });
  final PodcastModel audio;

  @override
  State<PodcastsDetailsViewYoutube> createState() =>
      _PodcastsDetailsViewYoutubeState();
}

class _PodcastsDetailsViewYoutubeState
    extends State<PodcastsDetailsViewYoutube> {
  late YoutubePlayerController _controller;
  var currentPosition = 0.0;
  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.audio.url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        showLiveFullscreenButton: false,
      ),
    );
    _controller.addListener(() {
      setState(() {
        currentPosition = _controller.value.position.inSeconds /
            60; // Convert to minutes but keep decimal portion
      });
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() {
      setState(() {});
    });
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.darkBlueColor,
        progressColors: const ProgressBarColors(
          playedColor: AppColors.darkBlueColor,
          bufferedColor: AppColors.darkBlueColor,
        ),
      ),
      onEnterFullScreen: () {
        // Prevent full-screen by forcing portrait orientation
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
      builder: (context, player) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.height * .5,
            width: context.width,
            child: player,
          ),
          VerticalSpace(context.height * .15),
          Text(
            widget.audio.title,
            textAlign: TextAlign.center,
            style: AppStyles.roboto18Medium.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ).withHorizontalPadding(16),
          VerticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10,
                    color: AppColors.darkBlueColor, size: 40),
                onPressed: () {
                  _controller.seekTo(Duration(seconds: 10));
                },
              ),
              HorizantalSpace(20),
              CircleAvatar(
                backgroundColor: AppColors.secondaryColor,
                radius: 30,
                child: IconButton(
                  icon: _controller.value.isPlaying
                      ? Icon(Icons.pause, color: AppColors.greyColor, size: 40)
                      : Icon(Icons.play_arrow,
                          color: AppColors.greyColor, size: 40),
                  onPressed: () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                    setState(() {});
                  },
                ),
              ),
              HorizantalSpace(10),
              IconButton(
                icon: Icon(Icons.forward_10,
                    color: AppColors.darkBlueColor, size: 40),
                onPressed: () {
                  _controller.seekTo(Duration(
                      seconds: _controller.value.position.inSeconds + 10));
                },
              ),
            ],
          ).withHorizontalPadding(16),
        ],
      ),
    );
  }
}
