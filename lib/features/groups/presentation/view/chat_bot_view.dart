import 'package:flutter/material.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/spacers.dart';

import '../widgets/input_message_field.dart';

class ChatBotViewBody extends StatelessWidget {
  const ChatBotViewBody({super.key});
  static const routeName = 'chat-bot';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                height: context.height,
                color: Colors.cyanAccent,
              ),
            ),
          ),
          VerticalSpace(16),
          InputMessageField(),
          VerticalSpace(16),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
