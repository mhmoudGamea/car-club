import 'dart:io';

import 'package:car_club/features/reviews/data/repos/review_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/helper.dart';

class ReviewRepoImple implements ReviewRepo{

  @override
  Future<Either<void, File>> pickReviewImage({required context})async {
    late File reviewImage;
    var picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.red,
          icon: FontAwesomeIcons.circleXmark,
          msg: "no image selected please,try again"
      );
      return left(null);
    } else {
      reviewImage = File(pickedImage.path);
      print('image path :: ${reviewImage.path}');
      return right(reviewImage);
    }

  }

  @override
  Future<Either<void,String>> uploadReviewImage({ File? image}) async {
    String? link;
    await FirebaseStorage.instance.ref()
        .child('reviewImages/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image)
        .then((p0) async {
          print("image uploaded");
      await p0.ref.getDownloadURL().then((value) {
        link = value;
        print("link is : $link");
      }).catchError((error){
        print(error.toString());
      });
    }).catchError((error){
      print(error.toString());
    });
    if(link!.isNotEmpty){
      print("link is : $link");
      return right(link!);

    }else{
      // print("link is : $link");
      return left(null);
    }
  }

  @override
  Future<void> addReview({required Map<String, dynamic> review}) async {
    await FirebaseFirestore.instance
        .collection("Reviews")
        .add(review).then((value)  {

    });
  }

}