import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/home/data/source/chat_remote_source.dart';

import 'chat_repo.dart';

class ChatRepoImpl implements ChatBotRepo {
  final ChatRemoteSource remoteSource;

  ChatRepoImpl(this.remoteSource);

  @override
  Future<Either<Failure, String>> getChatAnswer(String question) async {
    try {
      final result = await remoteSource.getGeminiAnswer(question);
      return Right(result);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
