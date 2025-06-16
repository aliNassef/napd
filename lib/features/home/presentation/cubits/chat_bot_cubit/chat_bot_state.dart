part of 'chat_bot_cubit.dart';

sealed class ChatBotState {
  const ChatBotState();
}

final class ChatBotInitial extends ChatBotState {}

final class ChatBotLoading extends ChatBotState {}

final class ChatBotLoaded extends ChatBotState {
  final String answer;
  const ChatBotLoaded({required this.answer});
}

final class ChatBotFailure extends ChatBotState {
  final String errMessage;
  const ChatBotFailure({required this.errMessage});
}

final class MessageAddedToChat extends ChatBotState {}
