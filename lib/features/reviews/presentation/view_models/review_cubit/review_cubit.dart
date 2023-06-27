import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/helper.dart';
import '../../../data/repos/review_repo.dart';

class ReviewCubit extends Cubit<ReviewStates> {
  ReviewCubit({required this.reviewRepo}) : super(InitialReview());
  // ADD button
  bool press = false;
  final ReviewRepo reviewRepo;
  late String reviewText;
  late double rate = 0.0;
  late ReviewModel reviewModel;

  setReviewRate(double value) {
    rate = value;
    emit(ChangeRateValue());
  }

  double getReviewRate() {
    return rate;
  }

  final TextEditingController controller = TextEditingController();
  TextEditingController getReviewTextController() {
    return controller;
  }

  // pick reviewImage
  File? file;
  Future<void> pickReviewImage({required context}) async {
    var result = await reviewRepo.pickReviewImage(context: context);
    emit(LoadingPickReviewImage());
    result.fold((l) {
      // file = null;
      emit(FailurePickReviewImage());
    }, (r) {
      file = r;
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.greenAccent,
          icon: FontAwesomeIcons.check,
          msg: "1 image selected");
      emit(SuccessPickReviewImage());
    });
  }

  // upload reviewImage
  String? link;
  Future<void> uploadReviewImage({File? image}) async {
    var result = await reviewRepo.uploadReviewImage(image: image!);
    emit(LoadingUploadReviewImage());
    result.fold((l) {
      link = " ";
      emit(FailureUploadReviewImage());
    }, (r) {
      link = r;
      emit(SuccessUploadReviewImage());
    });
  }

  // add review
  Future<void> addReview(
      context, String centerDoc, CarCenterModel carCenterModel) async {
    emit(LoadingAddReview());
    reviewModel = ReviewModel(
      like: like,
      reviewText: getReviewTextController().text,
      reviewImage: link ?? "",
      carCenterDoc: centerDoc,
      uId: uId,
      helpfulCount: 0,
      reviewRate: getReviewRate(),
    );
    // TODO: delete this unnecessary comment
    // CarCenterModel newCarCenter = CarCenterModel(
    //   user: user,
    //   isOpen: carCenterModel.isOpen,
    //   reviewCount: (carCenterModel.reviewCount)+1,
    //   credit: carCenterModel.credit,
    //   offers: carCenterModel.offers,
    //   delivery: carCenterModel.delivery,
    //   uId: carCenterModel.uId,
    //   latitude: carCenterModel.latitude,
    //   longitude: carCenterModel.longitude,
    //   date: carCenterModel.date,
    //   name:carCenterModel. name,
    //   description: carCenterModel.description,
    //   address:carCenterModel. address,
    //   phone: carCenterModel.phone,
    //   phone2: carCenterModel.phone2,
    //   openingTimes: carCenterModel.openingTimes,
    //   images: carCenterModel.images,
    //   distance: carCenterModel.distance,
    //   time: carCenterModel.time,
    // );//newCarCenter.toMap()
    await reviewRepo
        .addReview(
      review: reviewModel.toMap(),
    )
        .then((value) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.greenAccent,
          icon: FontAwesomeIcons.check,
          msg: "review added successfully");
      FirebaseFirestore.instance
          .collection("Centers")
          .doc(centerDoc)
          .update({'reviewCount': (carCenterModel.reviewCount) + 1});
      emit(SuccessAddReview());
    }).catchError((error) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.red,
          icon: FontAwesomeIcons.x,
          msg: "Review add failure");
      emit(FailureAddReview());
    });
  }

  late List<ReviewModel> reviews;
  late List<String> reviewsDocs;
  late List<String> carCenterReviewsDocs;
  Future<void> getReviews({required String carCenterDoc}) async {
    emit(LoadingGetReviews());
    reviews = [];
    reviewsDocs = [];
    carCenterReviewsDocs = [];
    FirebaseFirestore.instance
        .collection("Reviews")
        .snapshots()
        .listen((event) async {
      reviews = event.docs.map((e) => ReviewModel.fromJson(e.data())).toList();
      reviewsDocs = event.docs.map((e) {
        //e.data()['carCenterDoc'] == carCenterDoc
        if (e.data()['carCenterDoc'] == carCenterDoc) {
          carCenterReviewsDocs.add(e.id);
        }
        return e.id;
      }).toList();
      emit(SuccessGetReviews());
    }).onError((error) async {
      print(error.toString());
      emit(FailureGetReviews());
    });
  }

  late List<ReviewModel> carCenterReviews;
  Future<void> getCarCenterReviews({required String carCenterDoc}) async {
    carCenterReviews = [];
    emit(LoadingGetCarCenterReviews());
    print(carCenterDoc.toString());
    for (int i = 0; i < reviews.length; i++) {
      print(reviews[i].carCenterDoc.toString());
      // reviews[i].carCenterDoc == carCenterDoc
      if (reviews[i].carCenterDoc == carCenterDoc) {
        carCenterReviews.add(reviews[i]);
      }
    }
    print(reviews.length.toString());
    print(carCenterReviews.length.toString());
    emit(SuccessGetCarCenterReviews());
  }

  bool like = false;
  Future<void> clickHelpful(
      {required ReviewModel model, required String doc}) async {
    emit(LoadingLike());
    if (like == false) {
      like = !like;
      ReviewModel newIncreaseModel = ReviewModel(
        like: like,
        reviewText: model.reviewText,
        carCenterDoc: model.carCenterDoc,
        reviewImage: model.reviewImage,
        uId: model.uId,
        helpfulCount: model.helpfulCount + 1,
        reviewRate: model.reviewRate,
      );
      await FirebaseFirestore.instance
          .collection("Reviews")
          .doc(doc)
          .update(newIncreaseModel.toMap())
          .then((value) {
        emit(SuccessLikeIncrease());
      }).catchError((error) {
        emit(FailureLike());
      });
    } else {
      like = !like;
      ReviewModel newDecreaseModel = ReviewModel(
        like: like,
        reviewText: model.reviewText,
        carCenterDoc: model.carCenterDoc,
        reviewImage: model.reviewImage,
        uId: model.uId,
        helpfulCount: model.helpfulCount - 1,
        reviewRate: model.reviewRate,
      );
      await FirebaseFirestore.instance
          .collection("Reviews")
          .doc(doc)
          .update(newDecreaseModel.toMap())
          .then((value) {
        emit(SuccessLikeDecrease());
      }).catchError((error) {
        emit(FailureLike());
      });
    }
  }
}
