import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../groups/presentation/widgets/input_message_field.dart';
import '../../../groups/presentation/widgets/suggestion_column.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});
  static const routeName = 'chat-bot';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
