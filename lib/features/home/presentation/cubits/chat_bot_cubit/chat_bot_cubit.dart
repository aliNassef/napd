import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/chat_repo.dart';

part 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotRepo chatBotRepo;
  ChatBotCubit(this.chatBotRepo) : super(ChatBotInitial());

  Future<void> getChatAnswer(String question) async {
    emit(ChatBotLoading());
    final result = await chatBotRepo.getChatAnswer(question);
    result.fold(
      (l) => emit(
        ChatBotFailure(errMessage: l.errMessage),
      ),
      (r) => emit(
        ChatBotLoaded(answer: r),
      ),
    );
  }
}
