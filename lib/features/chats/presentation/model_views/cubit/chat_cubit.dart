import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/features/chats/data/models/chat_model.dart';
import 'package:car_club/features/chats/data/repos/chat_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(ChatInitial());

  CollectionReference chatsCollectionRF =
      FirebaseFirestore.instance.collection('users');

  List<UserModel> chats = [];

  // first function to get all users cats in UsersChatsViewBody
  void getUsersChats() {
    emit(UsersChatsLoading());
    chatsCollectionRF.snapshots().listen((event) {
      chats = [];
      for (var chat in event.docs) {
        if (chat.id != uId) {
          chats.add(UserModel.fromFireStore(chat));
        }
      }
      emit(UsersChatsSuccess(chats: chats));
    }, onError: (error) {
      emit(UsersChatsFailure(error: error));
    });
  }
  // this function to get all users to search view depending on the name i search about

  TextEditingController _searchController = TextEditingController();

  TextEditingController get getSearchController {
    return _searchController;
  }

  void getSearchUsersChats({String? name}) {
    emit(UsersSearchChatsLoading());

    if (name != null) {
      chatsCollectionRF
          .where('name', isGreaterThanOrEqualTo: name)
          .where('name', isLessThanOrEqualTo: '${name}z')
          .snapshots()
          .listen((event) {
        chats = [];
        for (var chat in event.docs) {
          if (chat.id != uId) {
            chats.add(UserModel.fromFireStore(chat));
          }
        }
        emit(UsersSearchChatsSuccess(chats: chats));
      }, onError: (error) {
        emit(UsersSearchChatsFailure(error: error));
      });
    } else {
      chatsCollectionRF.snapshots().listen((event) {
        chats = [];
        for (var chat in event.docs) {
          if (chat.id != uId) {
            chats.add(UserModel.fromFireStore(chat));
          }
        }
        emit(UsersSearchChatsSuccess(chats: chats));
      }, onError: (error) {
        emit(UsersSearchChatsFailure(error: error));
      });
    }
  }
  // this function is used to save the userModel while enter on his chat

  late UserModel _userModel;

  void setUserModel(UserModel userModel) {
    _userModel = userModel;
  }

  // send method is used to send text or picked image or picked camera image
  // to firebase
  Future<void> sendMessage(String message) async {
    emit(ChatLoading());

    ChatModel chatModel = ChatModel(
        date: DateTime.now().toIso8601String(),
        message: message,
        senderUid: uId,
        receiverUid: _userModel.uId);
    final response = await _chatRepo.sendMessage(chatModel);
    response.fold((failure) {
      emit(ChatFailure(error: failure.errMsg));
    }, (r) {
      emit(ChatSuccess());
    });
  }

  // more status add button
  bool _moreStatus = false;

  bool get getMoreStatus {
    return _moreStatus;
  }

  void addMoreStates() {
    _moreStatus = !_moreStatus;
    emit(AddMoreSatesClicked());
  }

  // attachment button

  // gallery button
  final ImagePicker picker = ImagePicker();

  // function to pick the image
  void pickImage() async {
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(ImageSelectedSuccess());
        savePickedImage(image);
      }
    } catch (error) {
      emit(ImageSelectedFailure());
    }
  }

  // function to save picked image in firebase storage then get the downloaded url
  // then send the downloaded url to firebase storage
  void savePickedImage(XFile? image) async {
    emit(StoredImageLoading());
    final response = await _chatRepo.uploadImage(File(image!.path));

    response.fold(
      (failure) {
        emit(StoredImageFailure());
      },
      (downloadedImageUrl) {
        // send method is used to send text or picked image or picked camera image
        sendMessage(downloadedImageUrl!);
        emit(StoredImageSuccess());
      },
    );
  }
  // camera button

  void pickCameraImage() async {
    try {
      XFile? cameraImage = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 300,
      );
      if (cameraImage != null) {
        emit(CameraImageSelectedSuccess());
        savePickedCameraImage(cameraImage);
      }
    } catch (error) {
      emit(CameraImageSelectedFailure());
    }
  }

  // function to save picked image in firebase storage then get the downloaded url
  // then send the downloaded url to firebase storage
  void savePickedCameraImage(XFile? cameraImage) async {
    emit(CameraImageStoredLoading());
    final response = await _chatRepo.uploadCameraImage(File(cameraImage!.path));

    response.fold(
      (failure) {
        emit(CameraImageStoredFailure());
      },
      (downloadedImageUrl) {
        // send method is used to send text or picked image or picked camera image
        sendMessage(downloadedImageUrl!);
        emit(CameraImageStoredSuccess());
      },
    );
  }
}
