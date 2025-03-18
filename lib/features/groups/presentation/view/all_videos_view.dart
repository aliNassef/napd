import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/all_videos_view_body.dart';

class AllVideosView extends StatelessWidget {
  const AllVideosView({super.key});
  static const routeName = 'all-videos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.videos),
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
