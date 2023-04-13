import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/chat_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, bool>> sendMessage(ChatModel chatModel);
}
