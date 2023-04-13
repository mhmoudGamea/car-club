import 'package:car_club/core/constants.dart';
import 'package:car_club/core/error/failure.dart';
import 'package:car_club/features/chats/data/models/chat_model.dart';
import 'package:car_club/features/chats/data/repos/chat_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ChatRepoImpl implements ChatRepo {
  CollectionReference chatRF = FirebaseFirestore.instance
      .collection('users')
      .doc(uId)
      .collection('chats');
  @override
  Future<Either<Failure, bool>> sendMessage(ChatModel chatModel) async {
    try {
      await chatRF
          .doc(chatModel.receiverUid)
          .collection('messages')
          .add(chatModel.toMap());
      await chatRF.doc(chatModel.receiverUid).set({'dummy': ''});
      return right(true);
    } catch (error) {
      return left(FireStoreFailure.fromSendMessage(error.toString()));
    }
  }
}
