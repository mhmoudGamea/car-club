import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:car_club/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  // pick image from user device section(1)
  File? _image;

  File? get getPickedImage {
    return _image;
  }

  void deletePickedImage() {
    _image = null;
    // print(_image);
    emit(ImageSelectedDeleted());
  }

  Future<void> pickMyImage() async {
    final ImagePicker picker = ImagePicker();

    if (_uploadedUrls.length >= 6) {
      emit(MaxNumberOfUploadedImages());
      throw MaxNumberOfImagesError('Sorry max number of images is 6');
    }

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    emit(ImageSelectedSuccess());
  }

  // save uploaded images urls from firebaseFirestore section(2)
  // first i upload images to firebase
  // second i save downloaded urls in this List
  // third i show these urls in galleryimage pacage

  final List<String> _uploadedUrls = [];

  List<String> get getUploadedUrls {
    return _uploadedUrls;
  }

  void addNewUrl(String url) {
    _uploadedUrls.add(url);
    emit(ImageAddedToList());
  }

  Future<void> uploadImageToFireStorage() async {
    emit(UploadImageLoading());

    String imageName =
        'images/yyTbyyKO9xREWQjg4aXIM2thJWp1/${DateTime.now().microsecondsSinceEpoch}';

    String? downloadedUrl;

    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref(imageName);

    try {
      await storageRef.putFile(_image!);

      emit(UploadImageSuccess());

      downloadedUrl = await storageRef.getDownloadURL();

      deletePickedImage();

      if (_uploadedUrls.length < 6) {
        addNewUrl(downloadedUrl);
      }
    } catch (e) {
      emit(UploadImageFailure());
      // print(e);
    }
  }
}
