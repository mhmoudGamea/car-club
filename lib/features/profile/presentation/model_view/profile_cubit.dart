

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants.dart';
import '../../data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit():super(ProfileInitial());

  File?  profileImage ;
  var picker = ImagePicker();
  Future <void> getProfileImage()async{
    final  PickedFile = await picker.pickImage(source: ImageSource.gallery,);
    if(PickedFile != null){
      profileImage = File(PickedFile.path ) ;
      emit(ProfileImagePickedSuccessState());
    }
    else {
     // print('No image selected.');
      emit(ProfileImagePickedErrorState());
    }
  }


  Future<void> getUsers()async{
    emit(GetUsersLoading());
    users = [];
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) {
          users = value.docs.map((e) => UserModel.fromJson(e.data())).toList();
          emit(GetUsersSuccess());
    }).catchError((error){
      emit(GetUsersFailure());
    });
  }

  Future<void> getUser({required String uId})async{
    for (var element in users) {
      if(element.uId == uId){
        user = element;
        print(user.name.toString());
      }
    }
  }

}
