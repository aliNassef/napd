import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../groups/presentation/widgets/input_message_field.dart';
import '../../../groups/presentation/widgets/suggestion_column.dart';
import '../cubits/chat_bot_cubit/chat_bot_cubit.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});
  static const routeName = 'chat-bot';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Luma',
        onLeadingTap: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<ChatBotCubit>(),
          child: ChatBotViewBody(),
        ).withHorizontalPadding(16),
      ),
    );
  }
}

class ChatBotViewBody extends StatelessWidget {
  const ChatBotViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBotCubit, ChatBotState>(
      buildWhen: (previous, current) =>
          current is ChatBotLoading ||
          current is ChatBotLoaded ||
          current is ChatBotFailure,
      builder: (context, state) {
        if (state is ChatBotLoaded) {
          log(state.answer);
        }
        return Column(
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
        );
      },
    );
  }
}
