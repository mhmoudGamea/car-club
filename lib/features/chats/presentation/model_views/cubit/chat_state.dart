part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

// users chats states section

class UsersChatsLoading extends ChatState {}

class UsersChatsSuccess extends ChatState {
  final List<UserModel> chats;
  UsersChatsSuccess({required this.chats});
}

class UsersChatsFailure extends ChatState {
  final String error;
  UsersChatsFailure({required this.error});
}

// users search chats states section

class UsersSearchChatsLoading extends ChatState {}

class UsersSearchChatsSuccess extends ChatState {
  final List<UserModel> chats;
  UsersSearchChatsSuccess({required this.chats});
}

class UsersSearchChatsFailure extends ChatState {
  final String error;
  UsersSearchChatsFailure({required this.error});
}

// sending message states section

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {}

class ChatFailure extends ChatState {
  final String error;
  ChatFailure({required this.error});
}

// add more status states section

class AddMoreSatesClicked extends ChatState {}

// attachment

// gallery

/* picked gallery */
class ImageSelectedSuccess extends ChatState {}

class ImageSelectedFailure extends ChatState {}

/* store gallery */
class StoredImageLoading extends ChatState {}

class StoredImageSuccess extends ChatState {}

class StoredImageFailure extends ChatState {}

// camera

/* picked camera image */
class CameraImageSelectedSuccess extends ChatState {}

class CameraImageSelectedFailure extends ChatState {}

/* store camera image */
class CameraImageStoredLoading extends ChatState {}

class CameraImageStoredSuccess extends ChatState {}

class CameraImageStoredFailure extends ChatState {}
