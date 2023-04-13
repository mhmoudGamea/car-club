import 'package:bloc/bloc.dart';
import 'package:car_club/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference chatsCollectionRF =
      FirebaseFirestore.instance.collection('users');

  List<UserModel> chats = [];
  List<UserModel> get getUsersChats {
    return [...chats];
  }

  void getChats() {
    emit(ChatLoading());
    chatsCollectionRF.snapshots().listen((event) {
      chats = [];
      for (var chat in event.docs) {
        chats.add(UserModel.fromFireStore(chat));
      }
      emit(ChatSuccess(chats: chats));
    }, onError: (error) {
      emit(ChatFailure(error: error));
    });
  }
}
