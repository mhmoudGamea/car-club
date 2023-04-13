part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final List<UserModel> chats;
  ChatSuccess({required this.chats});
}

class ChatFailure extends ChatState {
  final String error;
  ChatFailure({required this.error});
}
