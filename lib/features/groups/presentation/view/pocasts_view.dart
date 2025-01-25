import 'package:flutter/material.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';

class PocastsView extends StatelessWidget {
  const PocastsView({super.key});
  static const String routeName = 'pocasts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Podcasts'),
      body: SafeArea(
        child: PodcastsViewBody(),
      ),
    );
  }
}

class PodcastsViewBody extends StatelessWidget {
  const PodcastsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
