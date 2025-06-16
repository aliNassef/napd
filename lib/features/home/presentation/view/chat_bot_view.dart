import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../groups/presentation/widgets/input_message_field.dart';
import '../../../groups/presentation/widgets/message_bubble.dart';
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

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({
    super.key,
  });

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  List<String> messages = [];

  late TextEditingController _messageController;
  late ScrollController _scrollController;
  @override
  void initState() {
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      messages.add(_messageController.text.trim());
      context
          .read<ChatBotCubit>()
          .addMessageToChat(_messageController.text.trim());
      _messageController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBotCubit, ChatBotState>(
      listener: (context, state) {
        if (state is ChatBotLoaded) {
          messages.add(state.answer);
          _scrollToBottom();
        }
      },
      buildWhen: (previous, current) =>
          current is ChatBotLoading ||
          current is ChatBotLoaded ||
          current is ChatBotFailure ||
          current is MessageAddedToChat,
      builder: (context, state) {
        if (state is ChatBotLoaded) {}
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (_, index) {
                  return MessageBubble(
                    text: messages[index],
                    nip: index % 2 == 0
                        ? BubbleNip.leftBottom
                        : BubbleNip.rightBottom,
                    bubbleColor: index % 2 == 0
                        ? AppColors.darkBlueColor
                        : AppColors.secondaryColor,
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                  );
                },
              ),
              // SuggestionColumn(),
            ),
            VerticalSpace(16),
            InputMessageField(
              onSendTap: _sendMessage,
              messageController: _messageController,
            ),
            VerticalSpace(16),
          ],
        );
      },
    );
  }
}
