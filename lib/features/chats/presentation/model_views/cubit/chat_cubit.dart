import 'package:bloc/bloc.dart';
import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/features/chats/data/models/chat_model.dart';
import 'package:car_club/features/chats/data/repos/chat_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(ChatInitial());

  CollectionReference chatsCollectionRF =
      FirebaseFirestore.instance.collection('users');
  final uid = FirebaseAuth.instance.currentUser!.uid;

  List<UserModel> chats = [];

  // first function to get all users cats in UsersChatsViewBody
  void getUsersChats() {
    emit(UsersChatsLoading());
    chatsCollectionRF.snapshots().listen((event) {
      chats = [];
      for (var chat in event.docs) {
        if (chat.id != uid) {
          chats.add(UserModel.fromFireStore(chat));
        }
      }
      emit(UsersChatsSuccess(chats: chats));
    }, onError: (error) {
      emit(UsersChatsFailure(error: error));
    });
  }

  Future<void> sendMessage(UserModel userModel, String message) async {
    emit(ChatLoading());

    ChatModel chatModel = ChatModel(
        date: DateTime.now().toIso8601String(),
        message: message,
        senderUid: uid,
        receiverUid: userModel.uId);
    final response = await _chatRepo.sendMessage(chatModel);
    response.fold((failure) {
      emit(ChatFailure(error: failure.errMsg));
    }, (r) {
      emit(ChatSuccess());
    });
  }
}
