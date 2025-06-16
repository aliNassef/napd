import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ChatBotRepo {
  Future<Either<Failure, String>> getChatAnswer(String question);
}
