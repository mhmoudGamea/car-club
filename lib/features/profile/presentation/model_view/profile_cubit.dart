

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState);
  File?  profileImage ;
  final picker = ImagePicker();
  Future <void> getProfileImage()async{
    final  PickedFile = await picker.pickImage(source: ImageSource.gallery,);
    if(PickedFile != null){
      profileImage = File(PickedFile.path );
      emit(ProfileImagePickedSuccessState());
    }
    else {
      print('No image selected.');
      emit(ProfileImagePickedErrorState());
    }
  }


 }
