import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:car_club/core/error/failure.dart';
import 'package:car_club/features/chats/data/models/chat_model.dart';
import 'package:car_club/features/chats/data/repos/chat_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatRepoImpl implements ChatRepo {
  CollectionReference chatRF = FirebaseFirestore.instance.collection('users');

  @override
  Future<Either<Failure, bool>> sendMessage(ChatModel chatModel) async {
    try {
      await chatRF
          .doc(uId)
          .collection('chats')
          .doc(chatModel.receiverUid)
          .collection('messages')
          .add(chatModel.toMap());
      await chatRF
          .doc(chatModel.receiverUid)
          .collection('chats')
          .doc(uId)
          .collection('messages')
          .add(chatModel.toMap());
      return right(true);
    } catch (error) {
      return left(FireStoreFailure.fromSendMessage(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> uploadImage(File? image) async {
    String imageName = 'chat/$uId/${DateTime.now().microsecondsSinceEpoch}';
    final storageRef = FirebaseStorage.instance.ref(imageName);
    try {
      await storageRef.putFile(image!);
      return right(await storageRef.getDownloadURL());
    } on FirebaseException catch (error) {
      return left(StorageError(error.code));
    }
  }

  @override
  Future<Either<Failure, String?>> uploadCameraImage(File? image) async {
    String imageName = 'chat/$uId/${DateTime.now().microsecondsSinceEpoch}';
    final storageRef = FirebaseStorage.instance.ref(imageName);
    try {
      await storageRef.putFile(image!);
      return right(await storageRef.getDownloadURL());
    } on FirebaseException catch (error) {
      return left(StorageError(error.code));
    }
  }
}
