import 'package:flutter/material.dart'; 
import '../../../../core/widgets/appbars/custom_chat_app_bar.dart';
import '../widgets/group_chat_view_body.dart';

class GroupChatView extends StatelessWidget {
  const GroupChatView({super.key});
  static const routeName = 'group_chat_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomChatAppBar(
        title: 'Mamie\'s',
        image:
            'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
      ),
      body: SafeArea(
        child: const GroupChatViewBody(),
      ),
    );
  }
}
