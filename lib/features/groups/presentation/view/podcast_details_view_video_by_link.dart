import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/features/groups/data/model/podcast_model.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class PodcastDetailsViewVideoBylink extends StatefulWidget {
  const PodcastDetailsViewVideoBylink({super.key, required this.audio});
  final PodcastModel audio;

  @override
  State<PodcastDetailsViewVideoBylink> createState() =>
      _PodcastDetailsViewVideoBylinkState();
}

class _PodcastDetailsViewVideoBylinkState
    extends State<PodcastDetailsViewVideoBylink> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.audio.url));
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
    );
    videoPlayerController.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: context.height * 0.5,
          width: context.width,
          child: Chewie(
            controller: chewieController,
          ),
        ),
        VerticalSpace(20),
        Text(
          widget.audio.title,
          textAlign: TextAlign.center,
          style: AppStyles.roboto18Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(20),
        Slider(
          value: 0.6,
          onChanged: (value) {},
          activeColor: AppColors.darkBlueColor,
          inactiveColor: Colors.grey[300],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("15:00", style: TextStyle(color: Colors.grey)),
          ],
        ),
        VerticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.replay_10,
                color: AppColors.darkBlueColor,
                size: 40,
              ),
              onPressed: () {},
            ),
            HorizantalSpace(20),
            CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              radius: 30,
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: AppColors.greyColor,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            HorizantalSpace(10),
            IconButton(
              icon: Icon(
                Icons.forward_30,
                color: AppColors.darkBlueColor,
                size: 40,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
