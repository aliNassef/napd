import 'package:flutter/material.dart';
import '../widgets/for_you_view_body.dart';
import '../widgets/group_app_bar.dart';
import '../widgets/group_view_body.dart';

class GroupView extends StatefulWidget {
  const GroupView({super.key});

  @override
  State<GroupView> createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 0),
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: GroupAppBar(),
        body: TabBarView(
          children: [
            GroupViewBody(),
            ForyouViewBody(),
          ],
        ),
      ),
    );
  }
}
