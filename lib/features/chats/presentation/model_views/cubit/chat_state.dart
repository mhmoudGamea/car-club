part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class UsersChatsLoading extends ChatState {}

class UsersChatsSuccess extends ChatState {
  final List<UserModel> chats;
  UsersChatsSuccess({required this.chats});
}

class UsersChatsFailure extends ChatState {
  final String error;
  UsersChatsFailure({required this.error});
}

// sending message section

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {}

class ChatFailure extends ChatState {
  final String error;
  ChatFailure({required this.error});
}
