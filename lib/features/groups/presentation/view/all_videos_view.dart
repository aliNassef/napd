import 'package:flutter/material.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../widgets/all_videos_view_body.dart';

class AllVideosView extends StatelessWidget {
  const AllVideosView({super.key});
  static const routeName = 'all-videos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Videos'),
      body: SafeArea(
        child: Column(
          children: [
            VerticalSpace(30),
            Expanded(
              child: AllVideosViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}
