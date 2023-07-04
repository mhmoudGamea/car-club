import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? profileImage;

  Future<File?> pickProfileImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
      return profileImage;
    } else {
      emit(ProfileImagePickedErrorState());
      return null;
    }
  }

  Future<void> uploadPickedImage(File fileImage) async {
    String imageName = 'profile/$uId/${DateTime.now().microsecondsSinceEpoch}';
    final storageRef = FirebaseStorage.instance.ref(imageName);
    try {
      await storageRef.putFile(fileImage);
      // we get here the url from firebase storage
      final url = await storageRef.getDownloadURL();
      // then we safe this url in firestore database
      await updateUserProfileImage(url);
    } on FirebaseException catch (error) {
      StorageError(error.code);
    }
  }

  Future<void> updateUserProfileImage(String url) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'profileImage': url});
  }

  // a function that will take snapshot of all users and return the current authenticated user[realtime]
  UserModel getUserFromSnapshot(QuerySnapshot<Object?>? snapshot) {
    late UserModel userModel;
    snapshot!.docs.forEach((element) {
      if (element.id == uId) {
        userModel = UserModel.fromJson(element.data() as Map<String, dynamic>);
      }
    });
    return userModel;
  }

  Future<void> getUsers() async {
    emit(GetUsersLoading());
    users = [];
    await FirebaseFirestore.instance.collection("users").get().then((value) {
      users = value.docs.map((e) => UserModel.fromJson(e.data())).toList();
      emit(GetUsersSuccess());
    }).catchError((error) {
      emit(GetUsersFailure());
    });
  }

  Future<void> getUser({required String uId}) async {
    for (var element in users) {
      if (element.uId == uId) {
        user = element;
        print(user.name.toString());
      }
    }
  }
}
