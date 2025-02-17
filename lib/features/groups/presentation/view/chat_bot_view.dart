import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/input_message_field.dart';
import '../widgets/suggestion_column.dart';

class ChatBotViewBody extends StatelessWidget {
  const ChatBotViewBody({super.key});
  static const routeName = 'chat-bot';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SuggestionColumn(),
            //  ListView.builder(
            //   reverse: true,
            //   itemCount: 5,
            //   itemBuilder: (_, index) {
            //     return MessageBubble(
            //       text: 'Ali Nassef',
            //     );
            //   },
            // ),
          ),
          VerticalSpace(16),
          InputMessageField(),
          VerticalSpace(16),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
